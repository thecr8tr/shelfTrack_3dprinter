//

include <Variables.scad>

track_for_base_length=base_rail_length;
track_for_side_length=side_rail_height;

module track_for_base()
{
    difference()
    {
        union()
        {
            cube([shelf_track_width, shelf_track_depth,track_for_base_length]);
        }
        union()
        {
            translate([shelf_track_material_thickness,-.1,-.1]) cube([shelf_track_width-2*shelf_track_material_thickness,shelf_track_depth-shelf_track_material_thickness+.1, track_for_base_length+.2]);
        }
    }
}

module track_for_side()
{
    difference()
    {
        union()
        {
            cube([shelf_track_width, shelf_track_depth,track_for_side_length]);
        }
        union()
        {
            translate([shelf_track_material_thickness,-.1,-.1]) cube([shelf_track_width-2*shelf_track_material_thickness,shelf_track_depth-shelf_track_material_thickness+.1, track_for_side_length+.2]);
        }
    }
}

//Testing
//track_for_base();
//track_for_side();