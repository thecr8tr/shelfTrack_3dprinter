//

include <BlockWithPlate.scad>

//number of facets
$fn=40;

module 60_by_30_plate()
{
    cube([60,8,30],center=true);
}

//4mm overlap and 4mm down
translate([0,-30,4.5]) 60_by_30_plate();
translate([0,30,4.5]) 60_by_30_plate();
