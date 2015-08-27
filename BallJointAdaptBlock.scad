// 

include <BaseTrackBlock.scad>
//number of facets
$fn=40;


module track_tab()
{
    cube([18,2.7,5],center=true);
}

module ball_joint_mount()
{
    difference()
    {
        union()
        {
            cylinder(r1=14, r2=2.5, h=10);
        }
        union()
        {
            translate([-15,6.5,-1]) cube([28,28,28]);
            translate([-15,-34.5,-1]) cube([28,28,28]);
            translate([9,-10,-1]) cube([28,28,28]);
        }
    }
}

rotate([90,0,0]) translate ([6,0,30]) ball_joint_mount();
rotate([270,0,0]) translate ([6,0,30]) ball_joint_mount();