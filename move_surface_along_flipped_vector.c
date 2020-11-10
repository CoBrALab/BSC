/* Expands MNI object points from a surface, along the surface normal, by a
   input scaling factor.

   Author: Gabriel A. Devenyi <gdevenyi@gmail.com>
*/
#define HAVE_MINC2 1

#include <bicpl.h>
#include <stdio.h>

int main(int argc, char *argv[]) {
  VIO_File_formats    white_format, ref_format;
  object_struct   **white_objects, **ref_objects;
  int             white_n_objects, white_n_points, i, ref_n_objects, ref_n_points;
  polygons_struct *white_polygons, *ref_polygons;
  VIO_STR          white_obj_filename, ref_obj_filename, output_filename;
  VIO_Point           *white_points, *ref_points;

  /* get input arguments */
  initialize_argument_processing(argc, argv);
  if (!get_string_argument(NULL, &white_obj_filename) ||
      !get_string_argument(NULL, &ref_obj_filename) ||
      !get_string_argument(NULL, &output_filename)) {
    fprintf(stderr, "Usage: expand_object_along_surface_normal white_object.obj ref_object.obj output.obj\n");
    return(1);
  }

  /* open the obj file */
  if (input_graphics_file(white_obj_filename,
			  &white_format, &white_n_objects, &white_objects ) != VIO_OK ) {
        return( 1 );
  }

  if (input_graphics_file(ref_obj_filename,
			  &ref_format, &ref_n_objects, &ref_objects ) != VIO_OK ) {
        return( 1 );
  }

  /* make sure data is polygons */
  if( white_n_objects != 1 || get_object_type(white_objects[0]) != POLYGONS ) {
        fprintf(stderr, "File must contain exactly 1 polygons struct.\n" );
        return( 1 );
  }

  if( ref_n_objects != 1 || get_object_type(ref_objects[0]) != POLYGONS ) {
        fprintf(stderr, "File must contain exactly 1 polygons struct.\n" );
        return( 1 );
  }

  white_polygons = get_polygons_ptr(white_objects[0]);
  white_n_points = get_object_points(white_objects[0], &white_points);
  ref_polygons = get_polygons_ptr(ref_objects[0]);
  ref_n_points = get_object_points(ref_objects[0], &ref_points);

  for (i = 0; i < white_n_points; i++) {
    //printf("%lf\n", Point_x(ref_polygons->points[i]) - Point_x(white_polygons->points[i]));
    Point_x(white_polygons->points[i]) +=  - (Point_x(ref_polygons->points[i]) - Point_x(white_polygons->points[i])) ; 
    Point_y(white_polygons->points[i]) +=  - (Point_y(ref_polygons->points[i]) - Point_y(white_polygons->points[i])) ;
    Point_z(white_polygons->points[i]) +=  - (Point_z(ref_polygons->points[i]) - Point_z(white_polygons->points[i])) ;
  }
  output_graphics_file( output_filename, white_format, 1, white_objects );
  return(0);
}
