include <DeltaAngleBracketBlock.scad>

rotate([0,270,0]) delta_angle_bracket_block();
translate([-40,60,0]) rotate([90,0,0]) base_side_track_block_side();
translate([-40,-40,0]) rotate([90,0,0]) base_side_track_block_side();