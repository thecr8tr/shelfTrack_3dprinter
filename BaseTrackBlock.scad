// 

//number of facets
$fn=40;

//block shape
block_x=30;
block_y=60;
block_z=13;

// track channel
track_channel_x=block_x+10;
track_channel_y=25;
track_channel_z=13;

// block top
block_top_x=20;
block_top_y=block_y+10;
block_top_z=16.5;

// spacing of screw holes
block_screw_hole_x=7.5;
block_screw_hole_y=20;

module 5mm_screw_way()
{
    cylinder(d=5, h=50,  center=true);
}

module 5mm_screw_bevel()
{
    cylinder(d1=9.2, d2=5, h=2.5,  center=true);
}

module block_channel_cutout()
{
    cube([track_channel_x,track_channel_y,track_channel_z],center=true);
}

module top_block()
{
    difference()
    {
        union()
        {
            cube ([block_x,block_y,block_z],center=true);
        }
        union()
        {
        // Cut out for the channel
            translate([0,0,4]) block_channel_cutout();
        // Screw holes
            translate([block_screw_hole_x,block_screw_hole_y,0]) 5mm_screw_way();
            translate([-block_screw_hole_x,block_screw_hole_y,0]) 5mm_screw_way();
            translate([block_screw_hole_x,-block_screw_hole_y,0]) 5mm_screw_way();
            translate([-block_screw_hole_x,-block_screw_hole_y,0]) 5mm_screw_way();

        // Machine Screw Bevels ### Need to tinker with this to get bevel right depth and width
            translate([block_screw_hole_x,block_screw_hole_y,-5.26]) 5mm_screw_bevel();
            translate([-block_screw_hole_x,block_screw_hole_y,-5.26]) 5mm_screw_bevel();
            translate([block_screw_hole_x,-block_screw_hole_y,-5.26]) 5mm_screw_bevel();
            translate([-block_screw_hole_x,-block_screw_hole_y,-5.26]) 5mm_screw_bevel();
        }
    }
    
}

module track_tab()
{
    cube([18,2.7,5],center=true);
}

module BaseTrackBlock()
{
    union()
    {
        top_block();
        translate([0,5.4,0]) track_tab();
        translate([0,-5.4,0]) track_tab();
    }
}

BaseTrackBlock();
