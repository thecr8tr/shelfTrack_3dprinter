//

include <Variables.scad>

module traxxas_rod()
{
    cylinder(d=traxxas_rod_diameter, h=traxxas_rod_length);
}

module traxxas_rod_end()
{
    union()
    {
        cylinder(d=traxxas_rod_diameter, h=trazzas_rod_end_length-.85*trazzas_rod_end_hole_diameter);
        translate([-traxxas_rod_diameter/4,0,trazzas_rod_end_length-trazzas_rod_end_hole_diameter/2]) rotate([0,90,0]) cylinder(d=trazzas_rod_end_hole_diameter, h=traxxas_rod_diameter/2);
        //NOT SURE ON THESE MEASUREMENTS
        ///NOT SURE WHY THE EXTRA .25 BUT THERE IT IS 
        translate([m3_phillips_raised_cheese_head_rise/2+.25,0,trazzas_rod_end_length-trazzas_rod_end_hole_diameter/2]) rotate([0,90,0]) m3_philips_raised_cheese_head();
        //NOT SURE ON THESE MEASUREMENTS
        translate([-5,0,trazzas_rod_end_length-trazzas_rod_end_hole_diameter/2]) rotate([0,90,0]) cylinder(d=5, h=4);
    }
}

module traxxas_rod_assembly()
{
    union()
    {
        translate([0,0,trazzas_rod_end_length]) traxxas_rod();
        translate([0,0,trazzas_rod_end_length]) rotate([0,180,0]) traxxas_rod_end();
        translate([0,0,trazzas_rod_end_length+traxxas_rod_length]) rotate([0,0,180]) traxxas_rod_end();
    }
}

//traxxas_rod();
//traxxas_rod_end();
//traxxas_rod_assembly();