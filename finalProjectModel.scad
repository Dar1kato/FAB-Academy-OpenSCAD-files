/*
    Casing file
*/
use <tentacles.scad>
use <mainBody.scad>

$fn = $preview ? 50 : 60;

//! Scale for preview and rendering, not actual size
scale([0.05, 0.05, 0.05])
casing();

module casing() {
    translate([0, 0, 180])
    scale([12, 12, 12])
    skeleton();
    
    
    for ( i = [0:6]) {
        rotate([0, 0, 60 * i - 30])
        translate([200, 0, 40])
        scale([20, 20, 20])
        tentacle(joint_number = 3);
    }
/*
    Daniel Peña Cruz
    FAB Academy 2026
    Week #2 - CAD
    
    Final Project Sketch
    Project Casing file
*/

// Imports //
use <tentacles.scad>
use <mainBody.scad>

// Render Rules //
$fn = 70;

// Visualization //
/*! Scale for preview and rendering, not actual size */
scale([0.05, 0.05, 0.05])
casing();

// Module(s) //
module casing() {
    translate([0, 0, 180])
    scale([12, 12, 12])
    skeleton();
    
    
    for ( i = [0:6]) {
        rotate([0, 0, 60 * i - 30])
        translate([200, 0, 40])
        scale([20, 20, 20])
        tentacle(joint_number = 3);
    }
    
}
