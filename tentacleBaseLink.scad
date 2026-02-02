/*
    Daniel Peña Cruz
    FAB Academy 2026
    Week #2 - CAD
    
    Final Project Sketch
    Base Link file
*/

// Import //
use <node.scad>

// Visualization //
base_joint();

// Module(s) //
module base_joint(
    tentacle_diameter = 4,
    joint_lenght = 5,
    node_indentation = 4.5
) {
    $fn = 50;
        union(){
            // Body
            union() {
                difference() {
                    rotate([0, 90, 0])
                    cylinder(joint_lenght, d = tentacle_diameter);
                    
                    translate([6.5, 0, -2])
                    cylinder(joint_lenght * 0.8, d = tentacle_diameter + 1);
                }
                sphere(d = tentacle_diameter);
            }
            
            // Joint
            translate([node_indentation, 0, 0])
            node();
        }
    }