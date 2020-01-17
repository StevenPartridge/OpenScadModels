longSide = 227;
depth = 120;
height = 92;
shell = 4;

difference() {

    // Shown piece
    
    cube( [ longSide + shell, depth + shell, height + shell ] );
    // Cut out piece
    union() {
        translate( [ shell/2, shell/2, shell/2 ] ) {
            cube( [ longSide, depth, height ] );
        }
        linear_extrude(height = 4) {
            translate( [ shell, shell, 0 ] ) {
                //flat_heart();
            }
            translate( [ ( longSide + shell ) / 2, depth / 10, 0 ] ) {
                rotate( [ 0, 0, 45 ] ) {
                    scale( [ 3, 3, 0 ] ) {
                        flat_heart();
                    }
                }
            }
            
            translate( [ longSide, shell, 0 ] ) {
                rotate( [ 0, 0, 90 ] ) {
                    //scale( [ 3, 3, 0 ] ) {
                        //flat_heart();
                    //}
                }
            }
        }
        translate( [ 0 + ( shell / 2 ), depth + ( shell / 2 ), 0 + ( shell / 2 ) ] ) {
            cube( [ longSide, shell, height ] );
        }
    }

    
}



module flat_heart() {
  square(20);

  translate([10, 20, 0])
  circle(10);

  translate([20, 10, 0])
  circle(10);
}


