#!/bin/bash


for file in ./scans/*;
do

echo Rscript sigmoid_unsmoothed_left.R $(basename $file _t1.mnc)
echo Rscript sigmoid_unsmoothed_right.R $(basename $file _t1.mnc)

done > ./methods/joblist_unsmoothed