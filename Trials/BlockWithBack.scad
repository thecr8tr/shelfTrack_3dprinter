// 

include <BaseTrackBlock.scad>

//number of facets
$fn=40;

module 5_hole_plate()
{
    difference()
    {
        union()
        {
            cube([4,block_y,block_z*1.75]);
        }
        union()
        {
            translate([-5,block_y/6,block_z*1.75/4*3]) rotate([0,90,0]) cylinder(d=5, h=60);
            translate([-5,block_y/6*2,block_z*1.75/4*3]) rotate([0,90,0]) cylinder(d=5, h=60);
            translate([-5,block_y/6*3,block_z*1.75/4*3]) rotate([0,90,0]) cylinder(d=5, h=60);
            translate([-5,block_y/6*4,block_z*1.75/4*3]) rotate([0,90,0]) cylinder(d=5, h=60);
            translate([-5,block_y/6*5,block_z*1.75/4*3]) rotate([0,90,0]) cylinder(d=5, h=60);
            translate([-35,block_y/2+track_channel_y/2,track_channel_z]) rotate([180,0,0]) shelf_track_channel_cutout();
        }
    }
}

module block_with_back()
{
    union()
    {
        base_track_block();
        rotate([0,180,0])translate([0,0,-block_z]) 5_hole_plate();
    }
}

// block_with_back();