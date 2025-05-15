# AMFI NAV Data Extractor

This script downloads and extracts mutual fund NAV (Net Asset Value) data from AMFI (Association of Mutual Funds in India) and saves it in a tab-separated format (`scheme_nav.tsv`).

## What It Does

- Downloads data from: https://www.amfiindia.com/spages/NAVAll.txt
- Extracts:
  - **Scheme Name**
  - **Asset Value**
- Saves it as: `scheme_nav.tsv`

## How to Run

```bash
chmod +x extract_nav.sh
./extract_nav.sh
