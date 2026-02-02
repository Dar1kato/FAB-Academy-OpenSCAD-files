module node(
    node_diameter = 0.7,
    node_thickness = 0.55,
) {
        $fn = 10;
        rotate_extrude() {
            translate([node_diameter, 0, 0])
            circle(d = node_thickness);
        }
    }