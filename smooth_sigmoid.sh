#!/bin/bash

for file in ./sigmoid_fit/unsmoothed/*c_left_log.txt
do 
echo depth_potential -smooth 28.28 $file ./surfaces/GM_50_surfaces/$(basename $file _model_c_left_log.txt)_GM_50_surface_left.obj ./sigmoid_fit/smoothed/$(basename $file .txt)_20mm.txt
done > ./methods/joblist_smoothed

for file in ./sigmoid_fit/unsmoothed/*c_right_log.txt
do 
echo depth_potential -smooth 28.28 $file ./surfaces/GM_50_surfaces/$(basename $file _model_c_right_log.txt)_GM_50_surface_right.obj ./sigmoid_fit/smoothed/$(basename $file .txt)_20mm.txt
done >> ./methods/joblist_smoothed

for file in ./sigmoid_fit/unsmoothed/*c_left.txt
do 
echo depth_potential -smooth 28.28 $file ./surfaces/GM_50_surfaces/$(basename $file _model_c_left.txt)_GM_50_surface_left.obj ./sigmoid_fit/smoothed/$(basename $file .txt)_20mm.txt
done >> ./methods/joblist_smoothed

for file in ./sigmoid_fit/unsmoothed/*c_right.txt
do 
echo depth_potential -smooth 28.28 $file ./surfaces/GM_50_surfaces/$(basename $file _model_c_right.txt)_GM_50_surface_right.obj ./sigmoid_fit/smoothed/$(basename $file .txt)_20mm.txt
done >> ./methods/joblist_smoothed


for file in ./sigmoid_fit/unsmoothed/*ratio_left.txt
do
echo depth_potential -smooth 28.28 $file ./surfaces/GM_50_surfaces/$(basename $file _model_ratio_left.txt)_GM_50_surface_left.obj ./sigmoid_fit/smoothed/$(basename $file .txt)_20mm.txt
done >> ./methods/joblist_smoothed

for file in ./sigmoid_fit/unsmoothed/*ratio_right.txt
do
echo depth_potential -smooth 28.28 $file ./surfaces/GM_50_surfaces/$(basename $file _model_ratio_right.txt)_GM_50_surface_right.obj ./sigmoid_fit/smoothed/$(basename $file .txt)_20mm.txt
done >> ./methods/joblist_smoothed

