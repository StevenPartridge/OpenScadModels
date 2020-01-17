

width=50;
height=160;
thicc=4;
depth=width + 20;
angle=70;

cablewidth=15;
cableheight=10;

module top(){
    rotate([ angle, 0, 0] ){
        union(){
            translate([-191, -50, -54]){
                import("./Pop_Socket_Clip.stl");
            }
            cube([ width, height, thicc ]);
        }
    }
}

module base(){
    cube([ width, depth, thicc ]);
}

module cordCuttout(){
    cube([ cablewidth, cableheight, thicc * 4 ]);
}


difference(){
    union(){
        top();
        base();  
    }
    translate([ ( width/2 - cablewidth/2 ), thicc, thicc ]){
        rotate([ angle, 0, 0] ){
            cordCuttout();
        }
    }
}
