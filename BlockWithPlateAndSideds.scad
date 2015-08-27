//

include <BlockWithPlate.scad>

//number of facets
$fn=40;

module 60_by_30_plate()
{
    cube([8,60,30],center=true);
}

difference ()
{
    translate([-30,0,4.5]) 60_by_30_plate();
    
    
}

difference ()
{
    translate([30,0,4.5]) 60_by_30_plate();
    
    
}