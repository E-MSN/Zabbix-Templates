#!/usr/bin/env bash
# One-shot generator for "vLLM by Zabbix agent 2 active"
# Requires Bash 4+, jq, Docker CLI, and standard Linux utilities.
set -euo pipefail

##########################################################################
# Variables
output='./vllm.conf'
dry_run=0
running_only=0
##########################################################################
# Help
usage() {
    cat <<'HELP'
Usage: bash generate_vllm_conf.sh [--output FILE] [--dry-run] [--running-only]

Run on the Docker/Spark host. Default output: ./vllm.conf
The output file is fully replaced, without merging or creating a backup.
All matching containers, including stopped ones, are included by default.
Supports vllm/vllm-openai images (tags/digests), host networking, explicit
--port N or --port=N. No changes to Docker or the Zabbix template.
HELP
}
die() { printf 'ERROR: %s\n' "$*" >&2; exit 1; }
##########################################################################
# Command-line options
while (($#)); do
    case "$1" in
        --output) (($# >= 2)) || die '--output requires a file'; output=$2; shift 2 ;;
        --dry-run) dry_run=1; shift ;;
        --running-only) running_only=1; shift ;;
        -h|--help) usage; exit 0 ;;
        *) die "Unknown option: $1" ;;
    esac
done
##########################################################################
# Prerequisites
for cmd in docker jq mktemp; do
    command -v "$cmd" >/dev/null 2>&1 || die "Required command not found: $cmd"
done
##########################################################################
# Gather Docker information
if ((running_only)); then
    ids_text=$(docker ps -q)
else
    ids_text=$(docker ps -aq)
fi
[[ -n $ids_text ]] || die 'No containers found; existing file unchanged.'
mapfile -t ids <<< "$ids_text"
format='{"name":{{json .Name}},"image":{{json .Config.Image}},"network":{{json .HostConfig.NetworkMode}},"args":{{json .Config.Cmd}},"entrypoint":{{json .Config.Entrypoint}},"running":{{json .State.Running}}}'
records=$(docker inspect --type=container --format "$format" "${ids[@]}")
instances=$(printf '%s\n' "$records" | jq -se '
  map(
    . as $c
    | (.image | split("@")[0] | sub(":[^/]*$"; "")) as $repo
    | select($repo == "vllm/vllm-openai" or ($repo | endswith("/vllm/vllm-openai")))
    | (.name | ltrimstr("/")) as $name
    | if ($name | test("^[A-Za-z0-9][A-Za-z0-9_.-]*$")) then .
      else error("Invalid container name: " + $name) end
    | if .network == "host" then .
      else error($name + ": only host networking is supported") end
    | ((.entrypoint // []) + (.args // [])) as $args
    | if ($args | type) == "array" and all($args[]; type == "string") then .
      else error($name + ": unsupported command format") end
    | (reduce range(0; $args | length) as $i (null;
        if $args[$i] == "--port" then
          if $i + 1 < ($args | length) then $args[$i+1]
          else error($name + ": missing port value") end
        elif ($args[$i] | startswith("--port=")) then ($args[$i] | ltrimstr("--port="))
        else . end)) as $port
    | if $port == null then error($name + ": no explicit --port; configuration unchanged")
      elif ($port | test("^[0-9]+$")) | not then error($name + ": invalid port")
      elif ($port | tonumber) < 1 or ($port | tonumber) > 65535 then error($name + ": invalid port")
      else {name:$name, port:($port | tonumber), running:$c.running} end
  ) | sort_by(.name)
  | if length == 0 then error("No vLLM containers found; configuration unchanged")
    elif (map(.name) | unique | length) != length then error("Duplicate instance names")
    else . end
')
discovery=$(printf '%s\n' "$instances" | jq -c 'map({"{#INSTANCE}":.name})')
rows=$(printf '%s\n' "$instances" | jq -r '.[] | [.name, (.port|tostring), (if .running then "running" else "stopped" end)] | @tsv')
##########################################################################
# Generate vLLM configuration
generate() {
    printf '%s\n' '# vLLM Configuration' \
        '# Discovered vLLM instances:'
    while IFS=$'\t' read -r name port state; do
        printf '# %-24s port=%-5s %s\n' "$name" "$port" "$state"
    done <<< "$rows"
    printf "UserParameter=vllm.simple.discovery,printf '%%s\\\\n' '%s'\n" "$discovery"
    printf '%s' 'UserParameter=vllm.simple.metrics[*],case "$1" in '
    while IFS=$'\t' read -r name port state; do
        printf "%s) curl --noproxy '*' --fail --silent --show-error --connect-timeout 2 --max-time 8 http://127.0.0.1:%s/metrics ;; " "$name" "$port"
    done <<< "$rows"
    printf '%s\n' '*) echo "Unknown vLLM instance"; exit 1 ;; esac'
}
if ((dry_run)); then generate; exit 0; fi
[[ ! -L $output ]] || die "Refusing to replace a symbolic link: $output"
directory=$(dirname -- "$output")
[[ -d $directory ]] || die "Output directory does not exist: $directory"
[[ ! -e $output || -f $output ]] || die 'Output must be a regular file'
temporary=$(mktemp "$directory/.vllm-conf.XXXXXX")
trap 'rm -f -- "$temporary"' EXIT
generate > "$temporary"
chmod 0644 "$temporary"
mv -f -- "$temporary" "$output"
printf 'Written: %s\n' "$output"
printf '%s\n' "$rows"
printf '%s\n' 'Keep only one loaded file defining the vllm.simple keys.' \
    'After installation: sudo systemctl restart zabbix-agent2'
##########################################################################
