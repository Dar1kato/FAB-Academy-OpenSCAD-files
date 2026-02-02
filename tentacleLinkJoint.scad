/*
    Daniel Peña Cruz
    FAB Academy 2026
    Week #2 - CAD
    
    Final Project Sketch
    Link Joint file
*/

// Import //
use <node.scad>

// Visualization //
link_joint();

// Module(s)
module link_joint(
    joint_lenght = 5,
    tentacle_diameter = 4,
    node_indentation = 4.5
) {
    $fn = 50;
        union(){
            // Body
            difference() {
                rotate([0, 90, 0])
                cylinder(joint_lenght, d = tentacle_diameter);
                
                translate([6.5, 0, -tentacle_diameter / 2])
                cylinder(joint_lenght * 0.8, d = tentacle_diameter +1);
           
                translate([-1.5, 0, -tentacle_diameter / 2])
                cylinder(joint_lenght * 0.8, d = tentacle_diameter +1);
            }
            
            // Joints
            translate([node_indentation, 0, 0])
            node();
            
            translate([node_indentation - 4, 0, 0])
            node();
        }    
    }