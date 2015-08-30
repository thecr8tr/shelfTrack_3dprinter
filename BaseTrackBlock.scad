// 

include <Variables.scad>

// Track Channel
track_channel_x=block_x;
track_channel_y=shelf_track_width;
track_channel_z=shelf_track_depth;

// block top
block_top_x=block_screw_base_thickness;
block_top_y=block_y;
block_top_z=shelf_track_depth;

module 5mm_screw_way()
{
    cylinder(d=m5_shaft, h=block_z);
}

module track_tab()
{
    cube([block_x,minimum_material_thickness,minimum_material_thickness]);
}

module shelf_track_channel_cutout()
{
    difference()
    {
        union()
        {
            cube([track_channel_x+.2,track_channel_y,track_channel_z+.1]);
        }
        union()
        {
            translate([0,shelf_track_material_thickness,0]) track_tab();
            translate([0,track_channel_y-shelf_track_material_thickness-minimum_material_thickness,0])track_tab();
        }
    }
}

module base_track_block()
{
    difference()
    {
        union()
        {
            cube ([block_x,block_y,block_z]);
        }
        union()
        {
        // Cut out for the channel
            translate([-0.1,block_y/2-track_channel_y/2,minimum_material_thickness]) shelf_track_channel_cutout();
        // Screw holes
            translate([block_x/4,(block_y-track_channel_y)/4,.1]) 5mm_screw_way();
            translate([block_x/4*3,(block_y-track_channel_y)/4,.1]) 5mm_screw_way();
            translate([block_x/4,block_y-(block_y-track_channel_y)/4,.1]) 5mm_screw_way();
            translate([block_x/4*3,block_y-(block_y-track_channel_y)/4,.1]) 5mm_screw_way();

        // Nut Cavities
            translate([block_x/4,(block_y-track_channel_y)/4,-.02]) rotate([0,0,30]) m5_nut_cavity();
            translate([block_x/4*3,(block_y-track_channel_y)/4,-.02]) rotate([0,0,30]) m5_nut_cavity();
            translate([block_x/4,block_y-(block_y-track_channel_y)/4,-.02]) rotate([0,0,30]) m5_nut_cavity();
            translate([block_x/4*3,block_y-(block_y-track_channel_y)/4,-.02]) rotate([0,0,30]) m5_nut_cavity();
        }
    }
    
}

//base_track_block();
