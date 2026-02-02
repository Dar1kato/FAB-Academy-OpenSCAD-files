/*
    Daniel Peña Cruz
    FAB Academy 2026
    Week #2 - CAD
    
    Final Project Sketch
    Tip node file
*/

// Import //
use <node.scad>

// Visualization //
tip_joint();

// Module(s) //
module tip_joint(
    tentacle_diameter = 4,
    tip_lenght = 2,
    node_indentation = 4.5,
    joint_lenght = 5
) {
    $fn = 50;
    
        translate([2, 0, 0])
        rotate([0, 180, 0])
        union() {
            // Tip
            difference() {
                union() {
                    sphere(d = tentacle_diameter);
                    
                    rotate([0, 90, 0])
                    cylinder(tip_lenght, d = tentacle_diameter);
                }
                translate([3.5, 0, -2])
                cylinder(joint_lenght * 0.8, d = tentacle_diameter + 1);
            }
            
            // Joint
            translate([node_indentation - 3, 0, 0])
            node();
        }
    }