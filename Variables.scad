//////////////This Document Shall Provide Standard Measurements Throughout the Project//////////////

//M3 3mm Screws
m3_shaft=3;
m3_head_diameter=5.6;
m3_head_rise=1.65;

//M3 3mm Nuts
m3_nut_height=2.4;
    //Distance flat to flat == 5.5mm
m3_nut_diameter=6.45;
module m3_nut_cavity()
{
    union()
    {
        $fn=6;
        cylinder(d=m3_nut_diameter, h=m3_nut_height);
    }
}

//M5 5mm Screws
m5_shaft=5;
m5_head_diameter=9.2;
m5_head_rise=2.5;

//M5 5mm Nuts
m5_nut_height=4;
    //Distance flat to flat == 8mm
m5_nut_diameter=9.3;
module m5_nut_cavity()
{
    union()
    {
        $fn=6;
        cylinder(d=m5_nut_diameter, h=m5_nut_height);
    }
}

//Shelf Track
shelf_track_width=25.5;
shelf_track_depth=14;
shelf_track_material_thickness=1.5;

//Ball Joint ###ALL GUESSES HERE
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