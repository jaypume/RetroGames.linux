#!/usr/bin/env bash

read1() {
  cat GBA.ZH_clean_EN.csv | while read line; do
    read -d, col1 col2 < <(echo $line)
    echo "I got:$col1|$col2"
  done
}

read2() {
while IFS=, read -r index name zh zh_clean gba;
do
    echo "$zh_clean"
done < GBA.ZH_clean_EN.csv
}

read2
