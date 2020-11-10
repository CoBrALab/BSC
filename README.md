## BSC_methods_standardized
 
1. Copy-paste setup_folders in the desired directory and run it
2. Copy-paste 'run' in main folder
3. populate /methods with /data/chamal/projects/paroli/BSC_validation/methods
4. populate /scans with preprocessed t1s (from /final in CIVET output)
5. rename t1s so they fit the format : ID_t1.mnc
6. populate surfaces/WM_0_surfaces with white_surfaces from CIVET output
7. rename white_surfaces so they fit the format ID_WM_0_surface_left.obj (same for right)
8. populate surfaces/GM_50_surfaces with mid_surfaces from CIVET output
9. rename mid_surfaces so they fit the format ID_GM_50_surface_left.obj (same for right)
10. populate /surf_maps with /transforms/surfreg from CIVET output
11. open 'run' and run the lines from the main folder, step by step
