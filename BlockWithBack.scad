// 

include <BaseTrackBlock.scad>

//number of facets
$fn=40;

module 5_hole_plate()
{
    difference()
    {
        union()
        {
            cube([4,60,28],center=true);
        }
        union()
        {
            translate([0,0,-8])rotate([90,0,90]) cylinder(d=5, h=60, center=true);
            translate([-9,20,-8])rotate([90,0,90]) cylinder(d=5, h=60, center=true);
            translate([8,-20,-8])rotate([90,0,90]) cylinder(d=5, h=60, center=true);
            translate([-9,10,-8])rotate([90,0,90]) cylinder(d=5, h=60, center=true);
            translate([8,-10,-8])rotate([90,0,90]) cylinder(d=5, h=60, center=true);
            translate([0,0,11.5]) block_channel_cutout();
        }
    }
}

translate([17,0,-7.5]) 5_hole_plate();
