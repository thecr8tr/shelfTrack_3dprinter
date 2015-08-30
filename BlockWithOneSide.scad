// 

include <BaseTrackBlock.scad>

//number of facets
$fn=40;

module side_plate()
{
    difference ()
    {
        union()
        {
            cube([block_x,4,block_z*.75]);
        }
        union()
        {
            translate([block_x/4,5,block_z*.75/3*2])rotate([90,0,0]) 5mm_screw_way();
            translate([block_x/4*3,5,block_z*.75/3*2])rotate([90,0,0]) 5mm_screw_way();
            translate([block_x/4*2,5,block_z*.75/3])rotate([90,0,0]) 5mm_screw_way();
        }
    }
}

module block_with_one_side()
{
    union()
    {
        base_track_block();
        translate([0,0,-block_z*.75]) side_plate();
    }
}

//block_with_one_side();