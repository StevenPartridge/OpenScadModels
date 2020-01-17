
// Adjustable variables
$fn = 4;
// Target size for the occupying battery
totalHeight = 135;
// Target size for the occupying battery
insideRadius = 20;
// Shell thickness
shellThickness = 4;

// Calculated variables

// The outside thickness
outsideRadius = insideRadius + shellThickness;
// The radius of the cutout portion that makes the object hollow
capRadius = insideRadius + ( shellThickness / 2 );
// Distance of overlap between cap and body
cutoutDepth = 40;
// How much of the body do you want to be cap
capHeight = 50;
// Height of the body reliant on the cap height
bodyHeight = totalHeight - ( capHeight - cutoutDepth );
// depth of the cutout
cutoutHeight = bodyHeight - cutoutDepth;

module body() {
    difference() {
        
        difference() {
            // Main part of the body
            cube([ outsideRadius, outsideRadius, bodyHeight ]);
            // Cutout inside the main part of the body
            translate([ 2, 2, 2 ]) {
                cube([ insideRadius, insideRadius, bodyHeight ]);
            }
            // Air release cutout
            translate([ outsideRadius/2, outsideRadius/2, 0 ]){
                cylinder( shellThickness, shellThickness/2, shellThickness/2, true);
            }
        }
        // Cutout at the top
        translate([ 0, 0, cutoutHeight ]) { // Height of where the cutout starts
            difference() {
                cube([ outsideRadius, outsideRadius, cutoutDepth ]);
                translate([1,1,0]) {
                    cube([ capRadius, capRadius, cutoutDepth ]);
                }
            }
        }
    }
}

module cap() {
    difference() {
        // Main part of the cap
        cube([ outsideRadius, outsideRadius, capHeight ]);
        // Main cutout of the cap
        translate([ 2, 2, 2 ]) {
            cube([ insideRadius, insideRadius, 55 ]);
        }
        // Cutout at the top
        translate([ 1, 1, capHeight - cutoutDepth ]) { // height of where the cutout starts
            cube([ capRadius, capRadius, 55 ]);
        }
    }
}

cap();

translate([25,0,0]){
    body();
}



// 20mm by 125mm 