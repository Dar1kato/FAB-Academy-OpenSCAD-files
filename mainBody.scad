$fn = 50;
head_diameter = 40;

module skeleton(sides) {
    module inner_layer() {
        module side(z_rotation) {
            rotate([0, 90, z_rotation])
            circle(d = head_diameter +2);
        }
        rotation = 360 / sides;
        
        for (i = [1:sides - 1]) {
            side(i * rotation);
        }
    }
    
    difference(){
        sphere(d = head_diameter);
        
        sphere(d = head_diameter - 2);
        inner_layer();
    }
}

translate([0, 0, 20])
skeleton(10);