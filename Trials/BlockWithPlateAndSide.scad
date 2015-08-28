//

include <BlockWithPlate.scad>

//number of facets
$fn=40;

module 60_by_30_plate()
{
    cube([60,4,30],center=true);
}

translate([0,-28,-21.5]) 60_by_30_plate();