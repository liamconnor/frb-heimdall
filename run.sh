#!/bin/bash
TMP_PATH="/tmp/heimdall"
INPUT_PATH="/data/simpulse_nfrb20_DM35-1977_214sec_20190603-0837.fil"
OUTPUT_PATH="/data/output"
mkdir -p $TMP_PATH
heimdall -v -f $INPUT_PATH -dm 10. 3000. -rfi_no_narrow -rfi_no_broad -output_dir $TMP_PATH
# cols: DM, S/N, TIME, LOG_2_DOWNSAMPLE
cat $TMP_PATH/*.cand | awk 'BEGIN{FS=" "} { print $6 " " $1 " " $3 " " 2^$4 }' > $OUTPUT_PATH
