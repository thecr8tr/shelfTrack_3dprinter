//////////////This Document Shall Provide Standard Measurements Throughout the Project//////////////
//Objects with unknown measurements will be preceded by the following comment line:
//##########################################

//Number of Facets for circular shapes
//number of facets
$fn=40;

minimum_material_thickness=4;

//Print Area and Base Calcs
print_diameter=304.8; //12 inches
print_area_buffer=25.4; //1 inch
print_surface_diameter=print_diameter+print_area_buffer*2;
base_rail_length=print_surface_diameter*sqrt(3);
base_triangle_height=base_rail_length/2*sqrt(3);
side_rail_height=1000;

//M3 3mm Screws
m3_shaft=3;
m3_slotted_flat_head_diameter=5.6;
m3_slotted_flat_head_rise=1.65;
m3_phillips_raised_cheese_head_diameter=6;
m3_phillips_raised_cheese_head_rise=2.4;

//M3 3mm Nuts
m3_nut_height=2.4;
    //Distance flat to flat == 5.5mm
m3_nut_diameter=6.45;
module m3_philips_raised_cheese_head()
{
    difference()
    {
        cylinder(d=m3_phillips_raised_cheese_head_diameter, h=m3_phillips_raised_cheese_head_rise);
        union()
        {
            difference()
            {
                cylinder(d=m3_phillips_raised_cheese_head_diameter+.1, h=m3_phillips_raised_cheese_head_rise+.1);
                translate([0,0,-m3_phillips_raised_cheese_head_diameter/2*1.05]) sphere(d=2*m3_phillips_raised_cheese_head_diameter);
            }
        }
    }
}

module m3_nut_cavity()
{
    union()
    {
        $fn=6;
        cylinder(d=m3_nut_diameter, h=m3_nut_height);
    }
}
module 3mm_screw_bevel()
{
    cylinder(d1=m3_head_diameter, d2=m3_shaft, h=m3_head_rise);
}

//M5 5mm Screws
m5_shaft=5;
m5_head_diameter=9.2;
m5_head_rise=2.5;

//M5 5mm Nuts
m5_nut_height=4;
m5_nut_flat_to_flat=8;
m5_nut_diameter=9.3;
module m5_nut_cavity()
{
    union()
    {
        $fn=6;
        cylinder(d=m5_nut_diameter, h=m5_nut_height);
    }
}
module 5mm_screw_bevel()
{
    cylinder(d1=m5_head_diameter, d2=m5_shaft, h=m5_head_rise);
}

//###########################################
//Shelf Track
shelf_track_width=24.3;
shelf_track_depth=17.3;
shelf_track_material_thickness=1.5;

//###########################################
//Ball Joint
ball_joint_dowel=5;

///////Start Nema 17 Motor//////
Nema_17_Motor_Bolt_Hole=m3_shaft;
Nema_17_Motor_Bolt_Gap=31;
Nema_17_Motor_Spindle_Hole=22;
Nema_17_Motor_Shaft_Width=5;
Nema_17_Motor_Shaft_Length=24;
Nema_17_Motor_Length=42;
Nema_17_Motor_Width=42;
Nema_17_Motor_Height=48;
module Nema_17_Motor_Hole_Layout()
{
    union()
    {
        translate([Nema_17_Motor_Length/2,Nema_17_Motor_Length/2,-6])cylinder(d=Nema_17_Motor_Spindle_Hole, h=60);
        translate([Nema_17_Motor_Length/2-Nema_17_Motor_Bolt_Gap/2,Nema_17_Motor_Length/2-Nema_17_Motor_Bolt_Gap/2,-6]) cylinder(d=Nema_17_Motor_Bolt_Hole, h=60);
        translate([Nema_17_Motor_Length/2+Nema_17_Motor_Bolt_Gap/2,Nema_17_Motor_Length/2-Nema_17_Motor_Bolt_Gap/2,-6]) cylinder(d=Nema_17_Motor_Bolt_Hole, h=60);
        translate([Nema_17_Motor_Length/2-Nema_17_Motor_Bolt_Gap/2,Nema_17_Motor_Length/2+Nema_17_Motor_Bolt_Gap/2,-6]) cylinder(d=Nema_17_Motor_Bolt_Hole, h=60);
        translate([Nema_17_Motor_Length/2+Nema_17_Motor_Bolt_Gap/2,Nema_17_Motor_Length/2+Nema_17_Motor_Bolt_Gap/2,-6]) cylinder(d=Nema_17_Motor_Bolt_Hole, h=60);
    }
}

///////End Nema 17 Motor//////

//###########################################
//Plate Measurements
hot_plate_diameter=305;
hot_plate_thickness=6.5;

//HotEnd
hot_end_plate_thickness=5;
hot_end_plate_screw_hole=m5_shaft;
hot_end_plate_hot_end_hole=14;
hot_end_plate_x=70;
hot_end_plate_y=25;
hot_end_plate_x_slot_1_a=0;
hot_end_plate_x_slot_1_b=11;
hot_end_plate_x_slot_2_center=43;
hot_end_plate_x_slot_3_a=50;
hot_end_plate_x_slot_3_b=62;
hot_end_plate_y_slot_1_center=14;
hot_end_plate_y_slot_2_a=8;
hot_end_plate_y_slot_2_b=25;
hot_end_plate_y_slot_3_center=14;
hot_end_beyond_plate_thickness=4;
hot_end_beyond_plate_diameter=16;

//Effector
effector_distance_between_ball_joint_faces=40;

//Track Block Basics
block_screw_base_thickness=minimum_material_thickness*2+m5_nut_height;
block_y=shelf_track_width+minimum_material_thickness*2;
block_x=block_y*1.5;
block_z=shelf_track_depth+minimum_material_thickness*2;

//Traxxas Rods
traxxas_rod_length=304.8; //12 inches
traxxas_rod_diameter=5.842; //.23 inches
trazzas_rod_end_length=22.225; //7/8 inch
trazzas_rod_end_hole_diameter=9;
