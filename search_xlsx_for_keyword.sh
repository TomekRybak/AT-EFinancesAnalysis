#!/bin/bash

# Usage:
#   ./grep_xlsx.sh "search string" [directory]

SEARCH="$1"
DIR="${2:-.}"

if [ -z "$SEARCH" ]; then
    echo "Usage: $0 \"search string\" [directory]"
    exit 1
fi

for f in "$DIR"/*.xlsx; do
    [ -e "$f" ] || continue

    # Search inside the ZIP archive without extracting
    if unzip -p "$f" | grep -qi "$SEARCH"; then
        echo "MATCH in: $f"
    fi
done

