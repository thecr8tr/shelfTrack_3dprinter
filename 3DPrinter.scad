//

include <DeltaAngleBracketBlock.scad>
include <TrackPieces.scad>
include <Carriage.scad>
include <effector.scad>

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
        //rotate([180,0,0]) translate([0,0,-track_for_side_length]) corner_side_and_base();
    }
}

module stand()
{
    union()
    {
        2X_corner_side_and_base();
        translate([-minimum_material_thickness/2+base_triangle_height,minimum_material_thickness/2*sqrt(3)-base_rail_length/2,0]) rotate([0,0,120]) 2X_corner_side_and_base();
        rotate([0,0,240]) translate([minimum_material_thickness/2-base_triangle_height,-minimum_material_thickness/2*sqrt(3)+base_rail_length/2+shelf_track_material_thickness,0]) 2X_corner_side_and_base();
    }
}

module printer_carriages()
{
    translate([minimum_material_thickness,-effector_distance_between_ball_joint_faces/2,printer_carriage_height]) rotate([0,270,0]) carriages_with_traxxas();
    rotate([0,270,240]) translate([printer_carriage_height,base_rail_length/2-effector_distance_between_ball_joint_faces/2-shelf_track_material_thickness,base_triangle_height]) carriages_with_traxxas();
    rotate([0,270,120]) translate([printer_carriage_height,-base_rail_length/2-effector_distance_between_ball_joint_faces/2,base_triangle_height-minimum_material_thickness*2])carriages_with_traxxas();
}

stand();
printer_carriages();
translate([base_triangle_height/2+(offset-3)*5+.2,0.1,225]) rotate([0,0,30]) effector();