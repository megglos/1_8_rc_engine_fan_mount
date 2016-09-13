$fn=60;

difference() {
    cube(center = true,size = [42,52,50]);
    // motor cylinder
    translate([3,30,0]) rotate([90,0,0]) cylinder(h = 60, r = 21);
    // fan hole cylinder
    translate([-25,0,0]) rotate([90,0,90]) cylinder(h = 23, r1 = 18, r2 = 22);
    // half body cut
    translate([13,0,0]) cube(center = true,size = [32,60,55]);
    // front top & bottom cut
    translate([0,0,32])rotate([0,75,0]) cube(center = true,size = [10,52,52]);
    translate([0,0,-32])rotate([0,-75,0]) cube(center = true,size = [10,52,52]);
    // back cut
    translate([22,0,0]) cube(center = true,size = [10,52,52]);
    translate([18,0,0]) cube(center = true,size = [10,52,36]);
    // center cylinder cut
    translate([3,18,0]) rotate([90,0,0]) cylinder(h = 36, r = 23);    
    // fan flow cuts
    hull() {
        translate([11,16,21])rotate([0,-14,0]) rotate([0,0,18]) cube(center = true,size = [52,10,10]);
        translate([11,-16,21])rotate([0,-14,0]) rotate([0,0,-18]) cube(center = true,size = [52,10,10]);
    }
    hull() {
        translate([11,16,-21])rotate([0,14,0]) rotate([0,0,18]) cube(center = true,size = [52,10,10]);
        translate([11,-16,-21])rotate([0,14,0]) rotate([0,0,-18]) cube(center = true,size = [52,10,10]);
    }
    // screwholes
    translate([-25,16,16]) rotate([0,90,0]) cylinder(h = 20, r = 1.5);
    translate([-25,16,-16]) rotate([0,90,0]) cylinder(h = 20, r = 1.5);
    translate([-25,-16,16]) rotate([0,90,0]) cylinder(h = 20, r = 1.5);
    translate([-25,-16,-16]) rotate([0,90,0]) cylinder(h = 20, r = 1.5);
    // side cut (inner and outer)
    difference() {
        translate([3,25,0]) rotate([90,0,0]) cylinder(h = 5, r = 40);
        translate([3,25,0]) rotate([90,0,0]) cylinder(h = 5, r = 22.5);
    }
    difference() {
        translate([3,29,0]) rotate([90,0,0]) cylinder(h = 10, r = 40);
        translate([3,29,0]) rotate([90,0,0]) cylinder(h = 10, r = 25);
    }
    difference() {
        translate([3,-20,0]) rotate([90,0,0]) cylinder(h = 5, r = 40);
        translate([3,-20,0]) rotate([90,0,0]) cylinder(h = 5, r = 22.5);
    }
    difference() {
        translate([3,-19,0]) rotate([90,0,0]) cylinder(h = 10, r = 40);
        translate([3,-19,0]) rotate([90,0,0]) cylinder(h = 10, r = 25);
    }
} 
