$fn = 100;

joint_lenght = 5;
tip_lenght = 2;
joint_separation = 6;

module tentacle(joints, j_lenght, j_diameter) {
    // Base Joint
    module base_joint() {
        union(){
            // Body
            union() {
                difference() {
                    rotate([0, 90, 0])
                    cylinder(joint_lenght, 2, 2);
                    
                    translate([7, 0, 0])
                    sphere(r = 3);
                }
                sphere(2);
            }
            
            // Joint
            translate([4.8, 0, 0])
            rotate_extrude(angle = 360) {
                translate([1, 0, 0])
                circle(d = 0.5);
            }
        }
    }
    
    // Joint
    module joint() {
        union(){
            // Body
            difference() {
                rotate([0, 90, 0])
                cylinder(joint_lenght, 2, 2);
                
                translate([7, 0, 0])
                sphere(r = 3);
                
                translate([-2, 0, 0])
                sphere(r = 3);
            }
            
            // Joints
            translate([4.8, 0, 0])
            rotate_extrude(angle = 360) {
                translate([1, 0, 0])
                circle(d = 0.5);
            }
            
            translate([0.2, 0, 0])
            rotate_extrude(angle = 360) {
                translate([1, 0, 0])
                circle(d = 0.5);
            }
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
                    sphere(r = 2);
                    
                    rotate([0, 90, 0])
                    cylinder(tip_lenght, 2, 2);
                }
                
                translate([4, 0, 0])
                sphere(3);
            }
            
            // Joint
            translate([1.8, 0, 0])
            rotate_extrude(angle = 360) {
                translate([1, 0, 0])
                circle(d = 0.5);
            }
        }
    }
    
    // Tentacle creation
    rotate([90, 0, 0])
    base_joint();
    
    for (i = [1:joints]) {
        if (i % 2 == 0) {
            rotate([90, 0, 0])
            translate([joint_separation * i, 0, 0])
            joint();
        } else {
            translate([joint_separation * i, 0, 0])
            joint();
        }   
    }
    
    if ((joints + 1) % 2 == 0) {
        rotate([90, 0, 0])
        translate([joint_separation * (joints + 1), 0, 0])
        tip_joint();
    } else {
        translate([joint_separation * (joints + 1), 0, 0])
        tip_joint();
    }
}

tentacle(4);