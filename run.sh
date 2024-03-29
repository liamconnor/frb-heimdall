#!/bin/bash
TMP_PATH="/tmp/heimdall"
INPUT_PATH="/data/input/test_data"
OUTPUT_PATH="/data/output"
mkdir -p $TMP_PATH
heimdall -v -f $INPUT_PATH -dm 10. 3000. -rfi_no_narrow -rfi_no_broad -output_dir $TMP_PATH
# cols: DM, S/N, TIME, LOG_2_DOWNSAMPLE, FREQ_REF
cat $TMP_PATH/*.cand | awk 'BEGIN{FS=" "} { print $6 " " $1 " " $3 " " 2^$4 " " 1536.00 }' > $OUTPUT_PATH
