#!/bin/bash

# Generate new gray matter surfaces
./methods/generate_gray_surfaces 0 50 25
./methods/generate_gray_surfaces 0 25 12_5
./methods/generate_gray_surfaces 0 12_5 6_25
./methods/generate_gray_surfaces 12_5 25 18_75

# Generate new white matter surfaces
./methods/generate_white_surfaces

# Sample surfaces
module unload minc-toolkit
module load CIVET/1.1.12 qbatch
./methods/sample_surfaces GM_50
./methods/sample_surfaces GM_25
./methods/sample_surfaces GM_18_75
./methods/sample_surfaces GM_12_5
./methods/sample_surfaces GM_6_25
./methods/sample_surfaces WM_0
./methods/sample_surfaces WM_6_25
./methods/sample_surfaces WM_12_5
./methods/sample_surfaces WM_18_75
./methods/sample_surfaces WM_25
qbatch -N BSC_sample ./methods/joblist_sample

# Fit unsmoothed sigmoid curve
./methods/run_sigmoid_unsmoothed
cd ./methods
module unload CIVET
module load R/3.4.0
module load rstudio
module load R-extras/3.4.0
module load minc-toolkit/1.9.16
module load RMINC/1.5.1.0^minc-toolkit-1.9.16^R-3.4.0
module load mni.cortical.statistics
module load qbatch
qbatch -N BSC_unsmoothed joblist_unsmoothed
cd ..

# Smooth curves
./methods/smooth_sigmoid
module unload minc-toolkit
module load CIVET/1.1.12 qbatch
qbatch -N BSC_smoothed ./methods/joblist_smoothed


# Resample
./methods/resample

# Regress out mean curvature