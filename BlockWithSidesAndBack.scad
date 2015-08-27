// 

include <BlockWithBack.scad>

//number of facets
$fn=40;


//2mm into back and level with top of back
//blocks for  sides
translate([8,28.65,-12.5]) cube([18,2.7,18],center=true);
translate([8,-28.65,-12.5]) cube([14,2.7,18],center=true);