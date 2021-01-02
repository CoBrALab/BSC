#!/bin/bash

#cd ./surfaces/WM_0_surfaces
for file in ./surfaces/WM_0_surfaces/*left*;
do
echo ./methods/move_surface_along_flipped_vector $file ./surfaces/GM_12_5_surfaces/$(basename $file _WM_0_surface_left.obj)_GM_12_5_surface_left.obj ./surfaces/WM_12_5_surfaces/$(basename $file _WM_0_surface_left.obj)_WM_12_5_surface_left.obj
echo ./methods/move_surface_along_flipped_vector $file ./surfaces/GM_25_surfaces/$(basename $file _WM_0_surface_left.obj)_GM_25_surface_left.obj ./surfaces/WM_25_surfaces/$(basename $file _WM_0_surface_left.obj)_WM_25_surface_left.obj
echo ./methods/move_surface_along_flipped_vector $file ./surfaces/GM_18_75_surfaces/$(basename $file _WM_0_surface_left.obj)_GM_18_75_surface_left.obj ./surfaces/WM_18_75_surfaces/$(basename $file _WM_0_surface_left.obj)_WM_18_75_surface_left.obj
echo ./methods/move_surface_along_flipped_vector $file ./surfaces/GM_6_25_surfaces/$(basename $file _WM_0_surface_left.obj)_GM_6_25_surface_left.obj ./surfaces/WM_6_25_surfaces/$(basename $file _WM_0_surface_left.obj)_WM_6_25_surface_left.obj
done > joblist_WM

for file in ./surfaces/WM_0_surfaces/*right*;
do
echo ./methods/move_surface_along_flipped_vector $file ./surfaces/GM_12_5_surfaces/$(basename $file _WM_0_surface_right.obj)_GM_12_5_surface_right.obj ./surfaces/WM_12_5_surfaces/$(basename $file _WM_0_surface_right.obj)_WM_12_5_surface_right.obj
echo ./methods/move_surface_along_flipped_vector $file ./surfaces/GM_25_surfaces/$(basename $file _WM_0_surface_right.obj)_GM_25_surface_right.obj ./surfaces/WM_25_surfaces/$(basename $file _WM_0_surface_right.obj)_WM_25_surface_right.obj
echo ./methods/move_surface_along_flipped_vector $file ./surfaces/GM_18_75_surfaces/$(basename $file _WM_0_surface_right.obj)_GM_18_75_surface_right.obj ./surfaces/WM_18_75_surfaces/$(basename $file _WM_0_surface_right.obj)_WM_18_75_surface_right.obj
echo ./methods/move_surface_along_flipped_vector $file ./surfaces/GM_6_25_surfaces/$(basename $file _WM_0_surface_right.obj)_GM_6_25_surface_right.obj ./surfaces/WM_6_25_surfaces/$(basename $file _WM_0_surface_right.obj)_WM_6_25_surface_right.obj
done >> joblist_WM
