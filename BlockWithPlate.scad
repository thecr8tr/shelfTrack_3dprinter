//

include <BaseTrackBlock.scad>

//number of facets
$fn=40;

//plate shape
plate_shape_x=60;
plate_shape_y=60;
plate_shape_z=4;

// spacing of screw holes
plate_screw_hole_x=7.5;
plate_screw_hole_y=22.5;

module plate_shape()
{
    difference()
    {
        union()
        {
        translate([0,0,-4.5]) cube ([plate_shape_x,plate_shape_y,plate_shape_z],center=true);
        }
        union()
        {
            translate([plate_screw_hole_y,plate_screw_hole_y,0]) 5mm_screw_way();
            translate([-plate_screw_hole_y,plate_screw_hole_y,0]) 5mm_screw_way();
            translate([plate_screw_hole_y,-plate_screw_hole_y,0]) 5mm_screw_way();
            translate([-plate_screw_hole_y,-plate_screw_hole_y,0]) 5mm_screw_way();
            translate([plate_screw_hole_y,plate_screw_hole_x,0]) 5mm_screw_way();
            translate([-plate_screw_hole_y,plate_screw_hole_x,0]) 5mm_screw_way();
            translate([plate_screw_hole_y,-plate_screw_hole_x,0]) 5mm_screw_way();
            translate([-plate_screw_hole_y,-plate_screw_hole_x,0]) 5mm_screw_way();
        }
    }
}

plate_shape();
