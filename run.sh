#!/bin/bash

# Generate new gray matter surfaces
./methods/generate_gray_surfaces.sh 0 50 25
./methods/generate_gray_surfaces.sh 0 25 12_5
./methods/generate_gray_surfaces.sh 0 12_5 6_25
./methods/generate_gray_surfaces.sh 12_5 25 18_75

# Generate new white matter surfaces
./methods/generate_white_surfaces.sh

# Sample surfaces
# unload minc-toolkit at this point if there are conflicts with CIVET and minc-toolkit.
./methods/sample_surfaces.sh GM_50
./methods/sample_surfaces.sh GM_25
./methods/sample_surfaces.sh GM_18_75
./methods/sample_surfaces.sh GM_12_5
./methods/sample_surfaces.sh GM_6_25
./methods/sample_surfaces.sh WM_0
./methods/sample_surfaces.sh WM_6_25
./methods/sample_surfaces.sh WM_12_5
./methods/sample_surfaces.sh WM_18_75
./methods/sample_surfaces.sh WM_25
qbatch -N BSC_sample ./methods/joblist_sample

# Fit unsmoothed sigmoid curve
./methods/run_sigmoid_unsmoothed.sh
cd ./methods
qbatch -N BSC_unsmoothed joblist_unsmoothed
cd ..

# Smooth curves
./methods/smooth_sigmoid.sh
qbatch -N BSC_smoothed ./methods/joblist_smoothed

# Resample
./methods/resample.sh
