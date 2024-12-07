// By Movie Vertigo
// https://youtube.com/movievertigo
// https://twitter.com/movievertigo

size=30;
thickness=6;
headRadius=2;
headHeight=4;
headDist=headRadius/2;
headOffset=size/3/2;
headGap=0.4;
roundRadius=1;

epsilon=0.001;

baseR = sqrt(size*size/2);
$fn=32;

difference()
{
union()
{
    difference()
    {
        rotate([0,0,45])
        {
            cylinder(thickness, baseR, baseR-sqrt(2*thickness*thickness), $fn=4);
        }

        for (a = [0 : 90 : 270])
        {
            rotate([0,0,a])
            translate([size/2-headHeight-headDist,-headOffset,headHeight-headDist])
            {
                sphere(headRadius+headGap);
            }
        }
    }

    for (a = [0 : 90 : 270])
    {
        rotate([0,0,a])
        translate([size/2-headHeight+headDist,headOffset,headHeight+headDist])
        {
            sphere(headRadius);
        }
    }
}
difference()
{
    union()
    {
        for (a = [0 : 90 : 270])
        {
            rotate([0,0,a])
            translate([size/2-roundRadius-epsilon,-size/2-epsilon,-epsilon])
            cube([roundRadius+epsilon*2,size+epsilon*2,roundRadius+epsilon*2]);
        }
    }
    union()
    {
        for (a = [0 : 90 : 270])
        {
            rotate([0,0,a])
            {
                translate([size/2-roundRadius,size/2-roundRadius,roundRadius])
                {
                    rotate([90,0,0])
                        cylinder(size-roundRadius*2,roundRadius,roundRadius);
                    sphere(roundRadius);
                }
            }
        }
    }
}
}