#!/bin/sh


# Usage: ./split.sh file_name
file_name=$1

total_lines=$(awk 'END{print NR}' $file_name)
echo "Lines in the file $file_name are $total_lines"

echo "Splitiing files"

a1=$(($total_lines / 4))
a2=$(($total_lines / 2))
a3=$((3*$total_lines / 4))

awk "NR==1, NR==$a1"  $file_name > A1.txt
awk "NR==$a1+1, NR==$a2"  $file_name > A2.txt
awk "NR==$a2+1, NR==$a3"  $file_name > A3.txt
awk "NR==$a3+1, NR==$total_lines" $file_name > A4.txt