//BROKEN//

include <BaseTrackBlock.scad>

//number of facets
$fn=40;

//plate shape
plate_shape_x=60;
plate_shape_y=60;
plate_shape_z=4;

module plate_shape()
{
    difference()
    {
        union()
        {
        cube([plate_shape_x,plate_shape_y,plate_shape_z]);
        }
        union()
        {
            //translate([plate_shape_x/2-block_x/2,0,-.1]) cube([block_x, block_y, block_z+.1]);
            translate([(plate_shape_x-block_x)/4,plate_shape_y/5,-2]) 5mm_screw_way();
            translate([(plate_shape_x-block_x)/4,plate_shape_y/5*2,-2]) 5mm_screw_way();
            translate([(plate_shape_x-block_x)/4,plate_shape_y/5*3,-2]) 5mm_screw_way();
            translate([(plate_shape_x-block_x)/4,plate_shape_y/5*4,-2]) 5mm_screw_way();
            translate([plate_shape_x-(plate_shape_x-block_x)/4,plate_shape_y/5,-2]) 5mm_screw_way();
            translate([plate_shape_x-(plate_shape_x-block_x)/4,plate_shape_y/5*2,-2]) 5mm_screw_way();
            translate([plate_shape_x-(plate_shape_x-block_x)/4,plate_shape_y/5*3,-2]) 5mm_screw_way();
            translate([plate_shape_x-(plate_shape_x-block_x)/4,plate_shape_y/5*4,-2]) 5mm_screw_way();
        }
    }
}
module block_with_plate()
{
    base_track_block();
    translate([-plate_shape_x/4,0,0]) plate_shape();
}

block_with_plate();