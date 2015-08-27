// Gen1_delta clamp

include <BaseTrackBlock.scad>

//number of facets
$fn=40;

module angled_plate()
{
    difference()
    {
        union()
        {
            cube([30,2.7,40],center=true);
        }
        union()
        {
         // top holes
            translate([-8,0,-8]) rotate([90,0,0]) 5mm_screw_way();
            translate([8,0,8]) rotate([90,0,0]) 5mm_screw_way();
            translate([-8,0,8]) rotate([90,0,0]) 5mm_screw_way();
            translate([8,0,-8]) rotate([90,0,0]) 5mm_screw_way();
        }
    }
}

module cross_brace()
{
    cube([2.7,38,30],center=true);
}

module track_tab()
{
    cube([18,2.7,5],center=true);
}

union()
{
    translate([0,18,-22]) rotate([-150,0,0]) angled_plate();
    translate([0,-18,-22]) rotate([150,0,0]) angled_plate();
    translate([0,0,-23]) rotate([0,90,0]) cross_brace();
}

//plate for 5 bolt holes
// rotate([0,90,0])
//difference () {
//  
//    translate([15,0,-1]) cube([4,60,28],center=true);
//    translate([0,0,-8])rotate([90,0,90]) 5mm_screw_way();
//      translate([-9,20,-8])rotate([90,0,90]) 5mm_screw_way();
//      translate([8,-20,-8])rotate([90,0,90]) 5mm_screw_way();
//      translate([-9,10,-8])rotate([90,0,90]) 5mm_screw_way();
//      translate([8,-10,-8])rotate([90,0,90]) 5mm_screw_way();
//notch to keep opening for C-channel
//  translate([15,0,11.25]) cube([5,25,15],center=true);
//}
