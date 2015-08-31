// 

include <BaseTrackBlock.scad>

//number of facets
$fn=40;

module filament_ties()
{
    cylinder(d=5, h=5);
    translate([0,0,5]) cylinder(d=8, h=5);
}

module carriage()
{
    difference()
    {
        union()
        {
            translate([0,0,minimum_material_thickness]) cube([block_x, effector_distance_between_ball_joint_faces, block_z]);
            cube([block_x, effector_distance_between_ball_joint_faces, minimum_material_thickness]);
            translate([block_x/4,effector_distance_between_ball_joint_faces/3,0]) rotate([0,180,0]) filament_ties();
            translate([block_x/4*3,effector_distance_between_ball_joint_faces/3,0]) rotate([0,180,0]) filament_ties();
        }
        union()
        {
            translate([-.1,effector_distance_between_ball_joint_faces/2-track_channel_y/2,minimum_material_thickness*2]) shelf_track_channel_cutout();
        }
    }
}

//carriage();