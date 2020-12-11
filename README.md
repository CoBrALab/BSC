## Description
Code for our newly developed MRI biomarker, boundary sharpness coefficient (BSC).

The BSC quantifies the transition between white matter and gray matter and is highly influenced by intracortical myelin.
The proof-of-concept paper, written by Emily Olafson and others, is currently in available in preprint here : https://www.biorxiv.org/content/10.1101/2020.07.09.196212v2

## Dependencies
- minc-tool-kit 1.9.16(http://bic-mni.github.io/#v2-version-1918)
- CIVET 1.1.12 (https://www.bic.mni.mcgill.ca/ServicesSoftware/CIVET)
- R 3.4.0
- Rstudio
- R-extras 3.4.0
- RMINC (https://github.com/Mouse-Imaging-Centre/RMINC)
- the R module mni.cortical.statistics (https://github.com/BIC-MNI/mni.cortical.statistics)

## Procedure (specific to CIC users)
 
1. Copy-paste setup_folders (from /data/chamal/projects/paroli/BSC_validation/BSC or from this github) in the desired directory and run it
2. Copy-paste 'run' in main folder
3. populate /methods with everything in /data/chamal/projects/paroli/BSC_validation/BSC or from this github
4. populate /scans with preprocessed t1s (from /final in CIVET output)
5. rename t1s so they fit the format : ID_t1.mnc
6. populate surfaces/WM_0_surfaces with white_surfaces from CIVET output
7. rename white_surfaces so they fit the format ID_WM_0_surface_left.obj (same for right)
8. populate surfaces/GM_50_surfaces with mid_surfaces from CIVET output
9. rename mid_surfaces so they fit the format ID_GM_50_surface_left.obj (same for right)
10. populate /surf_maps with /transforms/surfreg from CIVET output
11. open 'run' and run the lines from the main folder, step by step
