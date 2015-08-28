//

include <DeltaAngleBracketBlock.scad>
include <TrackPieces.scad>

module corner_side_and_base()
{
    union()
    {
        color("Green") rotate([0,270,0]) delta_angle_bracket_block();
        color("Grey") rotate([150,270,0]) translate([block_x/2-shelf_track_width/2,-16.5,0]) track_for_base();
        color("Grey") rotate([0,0,90]) translate([block_x/2-shelf_track_width/2,4,0])track_for_side();
    }
}

module 2X_corner_side_and_base()
{
    union()
    {
        corner_side_and_base();
        rotate([180,0,0]) translate([0,-block_x,-track_for_side_length]) corner_side_and_base();
    }
}

module stand()
{
    union()
    {
        2X_corner_side_and_base();
        //works: 300 length, 258.5 for x, 209.5 for y
        rotate([0,0,120]) translate([-258.5,-209.5,0]) 2X_corner_side_and_base();
        rotate([0,0,240]) translate([-310.5,119,0]) 2X_corner_side_and_base();
    }
}

stand();