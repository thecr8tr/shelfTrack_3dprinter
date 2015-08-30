// Gen1_delta clamp
//////NEED TO CHECK TRIG IN THIS DOCUMENT

include <BaseTrackBlock.scad>

module angled_plate()
{
    difference()
    {
        union()
        {
            translate([0,-block_z+minimum_material_thickness,block_z/sqrt(3)]) cube([block_x,block_z,minimum_material_thickness]);
            translate([block_x,minimum_material_thickness,5]) rotate([90,270,0]) base_track_block();
            cube([block_x,minimum_material_thickness,block_z/sqrt(3)]);
        }
            translate([block_x/4-block_z/4,-block_z,0]) cube([block_z/sqrt(3),block_z/sqrt(3),block_z/sqrt(3)]);
            translate([block_x/4*3-block_z/4,-block_z,0]) cube([block_z/sqrt(3),block_z/sqrt(3),block_z/sqrt(3)]);
    }
}

module cross_brace()
{
    difference()
    {
        union()
        {
            cube([minimum_material_thickness,block_x,block_x]);
        }
        union()
        {
            translate([0,block_x/2-Nema_17_Motor_Length/2,block_x/2+Nema_17_Motor_Length/2]) rotate([0,90,0]) Nema_17_Motor_Hole_Layout();
        }
    }
}

module base_block_side_nut_slot()
{
    difference()
    {
        union()
        {
            base_track_block();
            cube([block_x,block_y,4]);
        }
        union()
        {
            translate([block_x/4-m5_nut_diameter/2,-.02,minimum_material_thickness]) cube([8, 10, m5_nut_height]);
            translate([block_x/4*3-m5_nut_diameter/2,-.02,minimum_material_thickness]) cube([8, 10, m5_nut_height]);
            translate([block_x/4-m5_nut_diameter/2,block_x-9.98,minimum_material_thickness]) cube([8, 10, m5_nut_height]);
            translate([block_x/4*3-m5_nut_diameter/2,block_x-9.98,minimum_material_thickness]) cube([8, 10, m5_nut_height]);
            translate([block_x/4,(block_y-track_channel_y)/4,minimum_material_thickness]) m5_nut_cavity();
            translate([block_x/4*3,(block_y-track_channel_y)/4,minimum_material_thickness]) m5_nut_cavity();
            translate([block_x/4,block_y-(block_y-track_channel_y)/4,minimum_material_thickness]) m5_nut_cavity();
            translate([block_x/4*3,block_y-(block_y-track_channel_y)/4,minimum_material_thickness]) m5_nut_cavity();
        }
    }
}

module delta_legs()
{
    difference()
    {
        union()
        {
            translate([0, block_x/3*2+minimum_material_thickness/2*sqrt(3) ,minimum_material_thickness/2]) rotate([-150,0,0]) angled_plate();
            //translate([0,block_x/3*2,0]) rotate([-150,0,0]) angled_plate();
            translate([block_x, block_x/3-minimum_material_thickness/2*sqrt(3), minimum_material_thickness/2]) rotate([-150,0,180]) angled_plate();
            //translate([block_x, block_x/3, minimum_material_thickness/2]) rotate([-150,0,180]) angled_plate();
        }
    }
}

module delta_legs_plus_cross_brace()
{
    difference()
    {
        union()
        {
            translate([0,0,(minimum_material_thickness/2)*sqrt(3)]) delta_legs();
            translate([0,0,-block_x/2+(minimum_material_thickness/2)*sqrt(3)]) rotate([0,90,0]) cross_brace();
        }
        union()
        {
            translate([0,0,0]) cube(block_x,block_x,block_x);
        }
    }
}

module delta_angle_bracket_block()
{
    union()
    {
        base_block_side_nut_slot();
        translate([0,0,0]) delta_legs_plus_cross_brace();
    }
}

//delta_angle_bracket_block();