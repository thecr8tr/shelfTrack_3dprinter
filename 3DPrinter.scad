//

include <DeltaAngleBracketBlock.scad>
include <TrackPieces.scad>
include <BallJointAdaptBlock.scad>

printer_carriage_height=300;

module corner_side_and_base()
{
    union()
    {
        color("Green") rotate([0,270,0]) delta_angle_bracket_block();
        color("Grey") translate([(block_z-minimum_material_thickness)/2-minimum_material_thickness/2,-minimum_material_thickness/2*sqrt(3),block_x/2-shelf_track_width/2]) rotate([150,270,0]) track_for_base();
        color("Grey") rotate([0,0,90]) translate([-shelf_track_width/2,minimum_material_thickness,0])track_for_side();
    }
}

module 2X_corner_side_and_base()
{
    union()
    {
        corner_side_and_base();
        rotate([180,0,0]) translate([0,0,-track_for_side_length]) corner_side_and_base();
    }
}
//#############NEED TO WORK ON THIS DOWN FOR AUTO SCALING
module stand()
{
    union()
    {
        2X_corner_side_and_base();
        rotate([0,0,120]) 2X_corner_side_and_base();
        //translate([base_triangle_height,-base_rail_length/2,13]) rotate([0,0,120]) 2X_corner_side_and_base();
        //rotate([0,0,240]) translate([0,0,0]) 2X_corner_side_and_base();
    }
}

stand();

module printer_carriages()
{
    color("Green") translate([0,0,printer_carriage_height]) rotate([0,270,0]) ball_joint_adapt_block();
    color("Green") translate([258.25,209.5,printer_carriage_height]) rotate([0,270,240]) ball_joint_adapt_block();
    color("Green") translate([310.6,-119,printer_carriage_height]) rotate([0,270,120]) ball_joint_adapt_block();
}

//stand();
//printer_carriages();