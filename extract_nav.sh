#!/bin/bash

# This script downloads the AMFI mutual fund NAV data,
# extracts only the Scheme Name and its corresponding Asset Value,
# and saves the output in a tab-separated file called scheme_nav.tsv.

DATA_URL="https://www.amfiindia.com/spages/NAVAll.txt"
OUTPUT_FILE="scheme_nav.tsv"

# Fetch the data silently (-s), then process with awk:
curl -s "$DATA_URL" | awk -F ';' '
BEGIN {
    # Print headers for TSV file
    OFS = "\t"
    print "Scheme Name", "Asset Value"
}

# Skip empty lines and comment lines (starting with #)
NF == 0 || $1 ~ /^#/ { next }

# Process lines with at least 5 fields (columns)
NF >= 5 {
    scheme = $4
    nav = $5
    # Only print if scheme is non-empty and nav looks like a number
    if (scheme != "" && nav ~ /^[0-9.]+$/) {
        print scheme, nav
    }
}
' > "$OUTPUT_FILE"

echo " Data extraction complete. Check the file '$OUTPUT_FILE' in your folder."
