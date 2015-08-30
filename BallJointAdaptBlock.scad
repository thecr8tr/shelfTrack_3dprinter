// 

include <BaseTrackBlock.scad>
include <Variables.scad>

//number of facets
$fn=40;

module ball_joint_mount()
{
    difference()
    {
        union()
        {
            cylinder(r1=block_z*1.5, r2=ball_joint_dowel+2, h=ball_joint_dowel*4);
        }
        union()
        {
            translate([-64.75,-block_z/2-.1,-.1]) cube([block_z*3,block_z*3,block_z*3]);
            translate([20.75,-block_z/2-.1,-.1]) cube([block_z*3,block_z*3,block_z*3]);
            translate([-block_z*1.5,-block_z*3.5,-.1]) cube([block_z*3,block_z*3,block_z*3]);
            translate([-block_z*1.5,block_z/2,-.1]) cube([block_z*3,block_z*3,block_z*3]);
        }
    }
}

module ball_joint_adapt_block()
{
    union()
    {
        base_track_block();
        rotate([90,0,0]) translate ([block_z/2+1.75,block_z/2,0]) ball_joint_mount();
        rotate([270,0,0]) translate ([block_z/2+1.75,-block_z/2,block_x]) ball_joint_mount();
    }
}

//ball_joint_adapt_block();