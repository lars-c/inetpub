#!/usr/bin/env bash

set -u
export LC_ALL=C

DURATION=60
SETTLE=15
METHOD="int64"
SLICE=10

OUT="${1:-power-results-$(hostname)-$(date +%F).txt}"

if ! command -v stress-ng >/dev/null; then
    echo "stress-ng is not installed."
    echo
    echo "Install with:"
    echo "  sudo apt install stress-ng"
    exit 1
fi

{
    echo "Power test"
    echo "=========="
    echo
    echo "Date          : $(date --iso-8601=seconds)"
    echo "Host          : $(hostname)"
    echo "stress-ng     : $(stress-ng --version 2>&1 | head -1)"
    echo "CPU worker    : 1"
    echo "CPU           : 0"
    echo "CPU method    : $METHOD"
    echo "Load slice    : ${SLICE} ms"
    echo "Stage duration: ${DURATION} s"
    echo
    echo "Results"
    echo "-------"
} > "$OUT"

run_stage()
{
    local load="$1"
    local label="$2"
    local watts

    echo
    echo "============================================================"
    echo "$label"
    echo "============================================================"
    echo

    if [[ "$load" -eq 0 ]]; then
        echo "No synthetic CPU load."
    else
        echo "CPU0 workload: ${load}% of one CPU thread"
    fi

    echo
    echo "READ THE WALL POWER METER DURING THE NEXT ${DURATION} SECONDS."
    echo
    echo "Starting: $(date +%T)"
    echo

    if [[ "$load" -eq 0 ]]; then
        sleep "$DURATION"
    else
        stress-ng \
            --cpu 1 \
            --cpu-method "$METHOD" \
            --cpu-load "$load" \
            --cpu-load-slice "$SLICE" \
            --taskset 0 \
            --timeout "${DURATION}s" \
            --quiet
    fi

    echo
    echo "Stage finished: $(date +%T)"
    echo

    read -r -p "Observed wall power in watts [Enter to skip]: " watts

    [[ -z "$watts" ]] && watts="n/a"

    printf "%-25s %s W\n" "$label" "$watts" >> "$OUT"
}

echo
echo "Power consumption test"
echo
echo "The test measures:"
echo
echo "  Idle"
echo "  10% of one CPU thread"
echo "  25% of one CPU thread"
echo "  50% of one CPU thread"
echo "  100% of one CPU thread"
echo
echo "Each measurement lasts ${DURATION} seconds."
echo
echo "For loaded stages, CPU0 is used with a fixed $METHOD workload."
echo

read -r -p "Press Enter when the machine and wall meter are ready..."

run_stage 0   "Idle"

for load in 10 25 50 100; do
    echo
    echo "Settling at idle for ${SETTLE} seconds..."
    sleep "$SETTLE"

    run_stage "$load" "${load}% of one thread"
done

echo
echo "============================================================"
echo "Finished"
echo "============================================================"
echo
cat "$OUT"
echo
echo "Saved: $OUT"
