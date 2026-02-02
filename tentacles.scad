/*
    Daniel Peña Cruz
    FAB Academy 2026
    Week #2 - CAD
    
    Final Project Sketch
    Tentacle file
*/

// Render Rules //
$fn = $preview ? 50 : 100;

// Visualization //
tentacle(joint_number = 1);

// Module(s) //
module tentacle(
    joint_number = 2,
    joint_lenght = 5,
    joint_separation = 4.6,
    
    tentacle_diameter = 4,
    tip_lenght = 2,
    
    node_diameter = 0.7,
    node_thickness = 0.55,
    node_separation = 5.8,
    node_indentation = 4.5
    ) 
{
    // Chain Node (Articulation)
    module node() {
        rotate_extrude() {
            translate([node_diameter, 0, 0])
            circle(d = node_thickness);
        }
    }
    
    // Base Joint
    module base_joint() {
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
    
    // Joint
    module link_joint() {
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
    
    // Tip Joint
    module tip_joint() {
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
   
    // Tentacle creation
    rotate([90, 0, 0])
    base_joint();
    
    // Links creation
    for (i = [1:joint_number]) {
        if (i % 2 == 0) {
            rotate([90, 0, 0])
            translate([joint_separation * i, 0, 0])
            link_joint();
        } else {
            translate([joint_separation * i, 0, 0])
            link_joint();
        }   
    }
    
    // Tip creation
    if ((joint_number + 1) % 2 == 0) {
        rotate([90, 0, 0])
        translate([joint_separation * (joint_number + 1), 0, 0])
        tip_joint();
    } else {
        translate([joint_separation * (joint_number + 1), 0, 0])
        tip_joint();
    }
}