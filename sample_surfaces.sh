#!/bin/bash
# This function samples the intensity at each vertex of the new white surfaces.

# e.g., WM_25
fraction=$1


for file in ./scans/*_t1.mnc
do
        echo volume_object_evaluate $file ./surfaces/"$fraction"_surfaces/$(basename $file _t1.mnc)_"$fraction"_surface_left.obj samples/$(basename $file _t1.mnc)_"$fraction"_left.txt
        echo volume_object_evaluate $file ./surfaces/"$fraction"_surfaces/$(basename $file _t1.mnc)_"$fraction"_surface_right.obj samples/$(basename $file _t1.mnc)_"$fraction"_right.txt

done >> ./methods/joblist_sample
