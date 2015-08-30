// 

include <BlockWithBack.scad>

//number of facets
$fn=40;


//2mm into back and level with top of back
//blocks for  sides
translate([0,57.3,-14]) cube([18,2.7,18]);
translate([0,0,-14]) cube([14,2.7,18]);