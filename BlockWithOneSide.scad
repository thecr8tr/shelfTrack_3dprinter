// 

include <BaseTrackBlock.scad>

//number of facets
$fn=40;

module side_plate()
{
    difference ()
    {
        union()
        {
            translate([0,-28,-7]) cube([30,4,15],center=true);
        }
        union()
        {
            translate([7.5,-28,-8])rotate([90,0,0]) cylinder(d=5, h=60, center=true);
            translate([-7.5,-28,-8])rotate([90,0,0]) cylinder(d=5, h=60, center=true);
            translate([0,-28,-3])rotate([90,0,0]) cylinder(d=5, h=60, center=true);
        }
    }
}

translate([0,0,-7]) side_plate();