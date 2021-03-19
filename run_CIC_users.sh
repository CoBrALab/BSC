#!/bin/bash

# Load modules
module load anaconda/5.1.0-python3 minc-toolkit/1.9.16 R/3.4.0 R-extras/3.4.0 rstudio/1.1.463 RMINC/1.5.1.0^minc-toolkit-1.9.16^R-3.4.0 mni.cortical.statistics/0.9.4 qbatch/2.2
module unload minc-toolkit/1.9.16
module load CIVET/2.1.0

# Generate new gray matter surfaces
./methods/generate_gray_surfaces.sh 0 50 25
qbatch joblist_GM_25
./methods/generate_gray_surfaces.sh 0 25 12_5
qbatch joblist_GM_12_5
./methods/generate_gray_surfaces.sh 0 12_5 6_25
qbatch joblist_GM_6_25
./methods/generate_gray_surfaces.sh 12_5 25 18_75
qbatch joblist_GM_18_75

# Generate new white matter surfaces
module unload CIVET/2.1.0
module load minc-toolkit/1.9.16 
./methods/generate_white_surfaces.sh
qbatch joblist_WM

# Sample surfaces
module unload minc-toolkit/1.9.16
module load CIVET/2.1.0
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
qbatch ./methods/joblist_sample

# Fit unsmoothed sigmoid curve
module unload CIVET/2.1.0
module load minc-toolkit/1.9.16 
./methods/run_sigmoid_unsmoothed.sh
cd ./methods
qbatch joblist_unsmoothed
cd ..

# Smooth curves
module unload minc-toolkit/1.9.16
module load CIVET/2.1.0
./methods/smooth_sigmoid.sh
qbatch ./methods/joblist_smoothed

# Resample
./methods/resample.sh
qbatch joblist_resample

