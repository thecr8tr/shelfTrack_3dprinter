// 

include <Variables.scad>

// Track Channel
track_channel_x=block_x;
track_channel_y=shelf_track_width;
track_channel_z=shelf_track_depth;

module 5mm_screw_way()
{
    cylinder(d=m5_shaft, h=block_z+.2);
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

module vert_set_screw_block()
{
    difference()
    {
        union()
        {
            cube([block_x, block_y, block_screw_base_thickness]);
        }
        union()
        {
            // Screw holes
                translate([block_x/4,block_y/5*3,-.1]) 5mm_screw_way();
                translate([block_x/4*2,block_y/5*2,-.1]) 5mm_screw_way();
                translate([block_x/4*3,block_y/5*3,-.1]) 5mm_screw_way();

            // Nut Cavities
                translate([block_x/4,block_y/5*3,block_screw_base_thickness/2-m5_nut_height/2]) rotate([0,0,30]) m5_nut_cavity();
                translate([block_x/4*2,block_y/5*2, block_screw_base_thickness/2-m5_nut_height/2]) rotate([0,0,30]) m5_nut_cavity();
                translate([block_x/4*3,block_y/5*3, block_screw_base_thickness/2-m5_nut_height/2]) rotate([0,0,30]) m5_nut_cavity();

            // Nut Ways
                translate([block_x/4-m5_nut_flat_to_flat/2,block_y/5*3,block_screw_base_thickness/2-m5_nut_height/2]) rotate([0,0,0]) cube([m5_nut_flat_to_flat,block_y/2,m5_nut_height]);
                translate([block_x/4*2-m5_nut_flat_to_flat/2,-block_y/5/2, block_screw_base_thickness/2-m5_nut_height/2]) rotate([0,0,0]) cube([m5_nut_flat_to_flat,block_y/2,m5_nut_height]);
                translate([block_x/4*3-m5_nut_flat_to_flat/2,block_y/5*3, block_screw_base_thickness/2-m5_nut_height/2]) rotate([0,0,0]) cube([m5_nut_flat_to_flat,block_y/2,m5_nut_height]);
        }
    }
}

module base_vert_track_block()
{
    difference()
    {
        union()
        {
            cube ([block_x,block_y,block_z-minimum_material_thickness]);
            translate([0,0,block_z-minimum_material_thickness]) vert_set_screw_block();
        }
        union()
        {
        // Cut out for the channel
            translate([-0.1,block_y/2-track_channel_y/2,minimum_material_thickness]) shelf_track_channel_cutout();
        }
    }
    
}

module side_set_screw_block()
{
    difference()
    {
        union()
        {
            cube([block_x, block_x, block_screw_base_thickness]);
        }
        union()
        {
            // Screw holes
                translate([block_x/4,block_x/5*3,-.1]) 5mm_screw_way();
                translate([block_x/4*2,block_x/5*2,-.1]) 5mm_screw_way();
                translate([block_x/4*3,block_x/5*3,-.1]) 5mm_screw_way();

            // Nut Cavities
                translate([block_x/4,block_x/5*3,block_screw_base_thickness/2-m5_nut_height/2]) rotate([0,0,30]) m5_nut_cavity();
                translate([block_x/4*2,block_x/5*2, block_screw_base_thickness/2-m5_nut_height/2]) rotate([0,0,30]) m5_nut_cavity();
                translate([block_x/4*3,block_x/5*3, block_screw_base_thickness/2-m5_nut_height/2]) rotate([0,0,30]) m5_nut_cavity();

            // Nut Ways
                translate([block_x/4-m5_nut_flat_to_flat/2,block_x/5*3,block_screw_base_thickness/2-m5_nut_height/2]) rotate([0,0,0]) cube([m5_nut_flat_to_flat,block_x/2,m5_nut_height]);
                translate([block_x/4*2-m5_nut_flat_to_flat/2,-block_x/5/2, block_screw_base_thickness/2-m5_nut_height/2]) rotate([0,0,0]) cube([m5_nut_flat_to_flat,block_x/2,m5_nut_height]);
                translate([block_x/4*3-m5_nut_flat_to_flat/2,block_x/5*3, block_screw_base_thickness/2-m5_nut_height/2]) rotate([0,0,0]) cube([m5_nut_flat_to_flat,block_x/2,m5_nut_height]);
        }
    }
}

module base_side_track_block()
{
    difference()
    {
        union()
        {
            cube ([block_x,block_x,block_z-minimum_material_thickness]);
            translate([0,0,block_z-minimum_material_thickness]) side_set_screw_block();
        }
        union()
        {
        // Cut out for the channel
            translate([-0.1,block_x/2-track_channel_y/2,minimum_material_thickness]) shelf_track_channel_cutout();
        }
    }
    
}


//base_vert_track_block();
//base_side_track_block();
