//

include <BlockWithPlate.scad>

//number of facets
$fn=40;

module 60_by_30_plate()
{
    cube([60,8,30]);
}

//4mm overlap and 4mm down
translate([-15,-4,-4]) 60_by_30_plate();
translate([-15,56,-4]) 60_by_30_plate();
