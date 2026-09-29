// v0.1 sunflower seed holder: open-top pouch for a medium freezer bag,
// hung on a bucket rim by rear hooks. Source: notebook sketch IMG_0148
// (2026-09-29). Sketch dimensions are inches; everything here is mm.
// Print at 100%. See README.md for orientation and what is still unconfirmed.
part="pouch"; // pouch | hook_test
$fn=48;
in=25.4;
// Sketch: 6.75" W x 8" L x 2.5" D. Treated as INSIDE pouch size (unconfirmed).
inner_w=6.75*in;   // 171.45
inner_d=2.5*in;    // 63.5
inner_h=8*in;      // 203.2
wall=2.4;          // 6 perimeters at 0.4 mm nozzle
floor_t=2.4;
corner_r=4;        // outside vertical corners
// Side view: hook throat 1.25" wide, leg 4" long, measured from the top.
hook_gap=1.25*in;  // 31.75, clear gap between pouch back and hook leg
hook_drop=4*in;    // 101.6, top of hook to tip of leg
hook_t=5;          // bar and leg thickness
hook_w=25;         // width of each hook along the pouch
hook_x=[-55,55];   // hook centers from pouch center line
gusset=6;          // fillet block under the top bar where it meets the back wall
test_w=15;         // hook_test coupon thickness
test_wall=40;      // length of back wall kept on the coupon below the leg tip

outer_w=inner_w+2*wall;
outer_d=inner_d+2*wall;
outer_h=inner_h+floor_t;
reach=hook_gap+hook_t;
assert(outer_w+20<=220 && outer_d+reach+20<=220,"Bed footprint exceeded (Ender 3 Neo 220 x 220)");
assert(outer_h<=250,"Taller than Ender 3 Neo Z (250 mm)");
assert(hook_drop<outer_h-floor_t,"Hook leg would pass the pouch floor");
assert(hook_x[1]+hook_w/2<=outer_w/2-corner_r,"Hook runs onto rounded corner");

module rounded_box(w,d,h,r){
 hull() for(x=[r,w-r],y=[r,d-r]) translate([x,y,0]) cylinder(r=r,h=h);
}
// Hook profile in the Y-Z plane; y=0 is the outer back face, z=0 the pouch top.
module hook_profile(){
 translate([-wall/2,-hook_t]) square([reach+wall/2,hook_t]);           // top bar, overlaps wall
 translate([hook_gap,-hook_drop]) square([hook_t,hook_drop]);         // leg
 translate([0,-hook_t]) difference(){                                 // gusset
  translate([-wall/2,-gusset]) square([gusset+wall/2,gusset+1]); // +1 overlaps the bar
  translate([gusset,-gusset]) circle(r=gusset);
 }
}
module hook(){
 rotate([90,0,90]) linear_extrude(hook_w,center=true) hook_profile();
}
module pouch(){
 difference(){
  rounded_box(outer_w,outer_d,outer_h,corner_r);
  translate([wall,wall,floor_t]) rounded_box(inner_w,inner_d,outer_h,max(corner_r-wall,0.5));
 }
 for(x=hook_x) translate([outer_w/2+x,outer_d,outer_h]) hook();
}
// Flat coupon: one hook plus a strip of back wall, printed on its side.
module hook_test(){
 linear_extrude(test_w) {
  translate([0,0]) hook_profile();
  translate([-wall,-(hook_drop+test_wall)]) square([wall,hook_drop+test_wall]);
 }
}
if(part=="pouch") pouch();
else if(part=="hook_test")
 translate([wall,hook_drop+test_wall,0]) hook_test();
else assert(false,str("Unknown part: ",part));
