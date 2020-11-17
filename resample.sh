#!/bin/bash

module load CIVET/1.1.12
module load anaconda/2.3


for file in ./sigmoid_fit/smoothed/*_model_c_left_log_20mm.txt
do
surface-resample /opt/quarantine/CIVET/1.1.12/build/CIVET-1.1.12/models/surf_reg_model_right.obj ./surfaces/GM_50_surfaces/$(basename $file _model_c_left_log_20mm.txt)_GM_50_surface_left.obj $file ./surf_map/$(basename $file _model_c_left_log_20mm.txt)_left_surfmap.sm ./sigmoid_fit/resampled/$(basename $file .txt)_rsl.txt
echo BSC $(basename $file _model_c_left_log_20mm.txt) left
done

for file in ./sigmoid_fit/smoothed/*_model_c_right_log_20mm.txt
do
surface-resample /opt/quarantine/CIVET/1.1.12/build/CIVET-1.1.12/models/surf_reg_model_right.obj ./surfaces/GM_50_surfaces/$(basename $file _model_c_right_log_20mm.txt)_GM_50_surface_right.obj $file ./surf_map/$(basename $file _model_c_right_log_20mm.txt)_right_surfmap.sm ./sigmoid_fit/resampled/$(basename $file .txt)_rsl.txt
echo BSC $(basename $file _model_c_right_log_20mm.txt) right
done



for file in ./sigmoid_fit/smoothed/*_model_ratio_left_20mm.txt
do
surface-resample /opt/quarantine/CIVET/1.1.12/build/CIVET-1.1.12/models/surf_reg_model_right.obj ./surfaces/GM_50_surfaces/$(basename $file _model_ratio_left_20mm.txt)_GM_50_surface_left.obj $file ./surf_map/$(basename $file _model_ratio_left_20mm.txt)_left_surfmap.sm ./sigmoid_fit/resampled/$(basename $file .txt)_rsl.txt
echo ratio $(basename $file _model_ratio_left_20mm.txt) left
done

for file in ./sigmoid_fit/smoothed/*_model_ratio_right_20mm.txt
do
surface-resample /opt/quarantine/CIVET/1.1.12/build/CIVET-1.1.12/models/surf_reg_model_right.obj ./surfaces/GM_50_surfaces/$(basename $file _model_ratio_right_20mm.txt)_GM_50_surface_right.obj $file ./surf_map/$(basename $file _model_ratio_right_20mm.txt)_right_surfmap.sm ./sigmoid_fit/resampled/$(basename $file .txt)_rsl.txt
echo ratio $(basename $file _model_ratio_right_20mm.txt) right
done
