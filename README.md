## BSC_methods_standardized
 
1. run setup_folders
2. populate /methods with /data/chamal/projects/paroli/BSC_validation/methods
3. put 'run' in main folder
3. populate /scans with preprocessed t1s (from /final in CIVET output)
4. rename t1s so they fit the format : ID_t1.mnc
5. populate surfaces/WM_0_surfaces with white_surfaces from CIVET output
6. rename white_surfaces so they fit the format ID_WM_0_surface_left.obj (same for right)
7. populate surfaces/GM_50_surfaces with mid_surfaces from CIVET output
8. rename mid_surfaces so they fit the format ID_GM_50_surface_left.obj (same for right)
9. populate /surf_maps with /transforms/surfreg from CIVET output