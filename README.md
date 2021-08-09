## Description
Code for our newly developed MRI biomarker, boundary sharpness coefficient (BSC).

The BSC quantifies the transition between white matter and gray matter and is highly influenced by intracortical myelin.
The proof-of-concept paper, written by Emily Olafson and others, is currently in available here : https://doi.org/10.1093/cercor/bhab015

## Dependencies
- minc-tool-kit 1.9.16(http://bic-mni.github.io/#v2-version-1918)
- CIVET 2.1.0 (https://www.bic.mni.mcgill.ca/ServicesSoftware/CIVET)
- R 3.4.0
- Rstudio
- R-extras 3.4.0
- RMINC (https://github.com/Mouse-Imaging-Centre/RMINC)
- the R module mni.cortical.statistics (https://github.com/BIC-MNI/mni.cortical.statistics)
- qbatch (https://github.com/pipitone/qbatch) but any tool for executing commands in parallel can be substituted (with modifications to run.sh)
- Anaconda 5.1.0

## Procedure
 
1. Copy-paste 'setup_folders.sh' in the desired directory and run it
2. Copy-paste 'run.sh' in main folder
3. populate /methods with every file from this GitHub
4. populate /scans with T1w volume in stereotaxic space (/final/ID_t1_tal.mnc in CIVET output)
5. rename t1s so they fit the format : ID_t1.mnc
6. populate surfaces/WM_0_surfaces with gray-white matter boundary surfaces in stereotaxic space (/surfaces/ID_white_surface_left_81920.obj and ID_white_surface_right_81920.obj from CIVET output)
7. rename white_surfaces so they fit the format ID_WM_0_surface_left.obj (same for right)
8. populate surfaces/GM_50_surfaces with mid-surfaces in stereotaxic space (/surfaces/ID_mid_surface_left_81920.obj and ID_mid_surface_right_81920.obj from CIVET output)
9. rename mid_surfaces so they fit the format ID_GM_50_surface_left.obj (same for right)
10. populate /surf_maps with surface maps transformations to surface model (/transforms/surfreg/ID_left_surfmap.sm and ID_right_surfmap.sm from CIVET output)
11. open 'run' and run the lines from the main folder, step by step (specific to CIC users)
