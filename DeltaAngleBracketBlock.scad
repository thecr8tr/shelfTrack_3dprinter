// Gen1_delta clamp

include <BaseTrackBlock.scad>


module cross_brace()
{
    difference()
    {
        union()
        {
            cube([minimum_material_thickness,block_x,block_x]);
        }
        union()
        {
            translate([0, block_x/2-Nema_17_Motor_Length/2 ,block_x/2+Nema_17_Motor_Length/2]) rotate([0,90,0]) Nema_17_Motor_Hole_Layout();
        }
    }
}

module delta_legs()
{
    translate([block_x,0,0]) rotate([300, 0, 0]) rotate([0,0,90]) base_side_track_block();
    rotate([300, 0, 180]) rotate([0,0,90]) base_side_track_block();
}

module delta_legs_plus_cross_brace()
{
    hexagon_radial=(block_z+block_screw_base_thickness-minimum_material_thickness);
    difference()
    {
        union()
        {
            translate([0,0,hexagon_radial-(block_z-block_screw_base_thickness+minimum_material_thickness)/sqrt(3)-.5]) rotate([0,90,0]) cylinder(d=2*hexagon_radial, h=block_x, $fn=6);
            translate([0,0,-block_screw_base_thickness/2*sqrt(3)]) delta_legs();
            translate([0,-block_x/2,-sqrt(3)*block_x/2+minimum_material_thickness-block_screw_base_thickness/2*sqrt(3)]) rotate([0,90,0]) cross_brace();
        }
        union()
        {
            difference()
            {
                translate([-.1,-block_x,0]) cube([2*block_x, 2*block_x, 2*block_x]);
                difference()
                {
                    translate([0,(hexagon_radial*2)/sqrt(3)-(block_x/2),0]) cube([block_x,block_x,block_z]);
//#################TODO FIX TRANSLATION for AUTO
                    translate([0-.1,61.665,0]) rotate([120,0,0]) cube([block_x+.2,block_x+.2,block_z]);
                }
                difference()
                {
                    translate([0,(-hexagon_radial*2)/sqrt(3)+(block_x/2)-block_x,0]) rotate([0,0,0]) cube([block_x,block_x,block_z]);
//#################TODO FIX TRANSLATION for AUTO
                    translate([0-.1,-32.45,0]) rotate([60,0,0]) cube([block_x+.2,block_x+.2,block_z]);
                }
            }
        }
    }
}

module delta_angle_bracket_block()
{
    union()
    {
        translate([0,-block_y/2,0]) base_vert_track_block();
        delta_legs_plus_cross_brace();
    }
}

//delta_angle_bracket_block();