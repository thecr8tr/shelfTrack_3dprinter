//

include <BlockWithPlate.scad>

//number of facets
$fn=40;

module 60_by_30_plate()
{
    cube([8,60,30]);
}

difference ()
{
    translate([-19,0,-4]) 60_by_30_plate();
    
    
}

difference ()
{
    translate([41,0,-4]) 60_by_30_plate();
    
    
}