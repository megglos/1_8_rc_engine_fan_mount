$fn=60;

module triangle(base, peak, thickness){
    polyhedron(
        points = [
            [0,0,0], [base, 0, 0], [base/2, peak, 0],
            [0,0,thickness], [base, 0, thickness], [base/2, peak, thickness]
        ],
        faces = [
            [2, 1, 0], 
            [0, 1, 4, 3],
            [1, 2, 5, 4],
            [5, 2, 0, 3],
            [3, 4, 5]
        ]
    );
}

difference() {
    translate([0,0,2]) cube(center = true,size = [42,52,52]);
    // motor cylinder
    translate([3,30,0]) rotate([90,0,0]) cylinder(h = 60, r = 21);
    // fan hole cylinder
    translate([-25,0,0]) rotate([90,0,90]) cylinder(h = 23, r1 = 18, r2 = 22);
    translate([-13,0,0.2]) rotate([0,-90,0]) difference() {
        cylinder(h = 23, r1 = 22, r2 = 14);
        translate([-18,-23.5,0]) cube(size = [36,10,23]);
        translate([-18,13.5,0]) cube(size = [36,10,23]);
    }
    // half body cut
    translate([13,0,0]) cube(center = true,size = [32,60,60]);
    // front top & bottom cut
    translate([0,0,36])rotate([0,65,0]) cube(center = true,size = [10,52,52]);
    translate([0,0,-32])rotate([0,-75,0]) cube(center = true,size = [10,52,52]);
    // center cylinder cut
    translate([3,18.25,0]) rotate([90,0,0]) cylinder(h = 36.5, r = 23);    
    // fan flow cuts
    hull() {
        translate([11,16,27]) rotate([0,-21,18]) cube(center = true,size = [52,10,10]);
        translate([11,-16,27]) rotate([0,-21,-18]) cube(center = true,size = [52,10,10]);
    }
    hull() {
        translate([11,16,-21]) rotate([0,10,18]) cube(center = true,size = [52,10,10]);
        translate([11,-16,-21]) rotate([0,10,-18]) cube(center = true,size = [52,10,10]);
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
translate([-15,-2.5,24]) rotate([155,0,90]) triangle(5,5,0.4);

