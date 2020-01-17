
cube([100, 200, 8], true);

translate([0,-80,-25]){
    rotate([-75, 0, 0]){
        cube([100, 50, 8], true);
    }
}

translate([-215, -160, -54.3]){
    import("./Pop_Socket_Clip.stl");
}
