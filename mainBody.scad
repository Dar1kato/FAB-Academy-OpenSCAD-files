/*
    Daniel Peña Cruz
    FAB Academy 2026
    Week #2 - CAD
    
    Final Project Sketch
    Head Shell file
*/
// Render Rules //
$fn = $preview ? 50 : 200;

// Visualization //
translate([0, 0, 20])
skeleton();

// Module(s) //
module skeleton(
    sides = 6,
    head_diameter = 40,
    hole_diameter = 8
    ) 
{
    module inner_layer() {
        
        module tentacle_hole(radius, angle, trans) {
            translate([radius*cos(angle), radius*sin(angle), trans])
            sphere(d = hole_diameter);
        }
        
        module side(z_rotation) {
            rotate([0, 90, z_rotation])
            linear_extrude(1)
            circle(d = head_diameter + 2);
        }
        rotation = 360 / sides;
        
        for (i = [0:sides - 1]){            
            side(i * rotation);
            
            hull(){
            tentacle_hole(head_diameter / 2, i * rotation - 30, -10);
            tentacle_hole(head_diameter / 3, i * rotation - 30, -13);
            }
        }
    }
    
    difference(){
        sphere(d = head_diameter);
        
        sphere(d = head_diameter - 2);
        inner_layer();
        
        translate([0, 0, -40])
        cube(50, true);
    }
}