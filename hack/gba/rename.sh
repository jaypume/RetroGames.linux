#!/bin/bash

file1="gamef.txt"
file2="gamej.txt"
paste $file1 $file2 | while IFS="$(printf '\t')" read -r f1 f2
do
	mv "$f1" "$f2" 
done
