// Replacement spring for a bag clip

// Parameters
ttop = 2.75;
tbottom = 2;
dblister = 2.8;
rtop = 5.8;
angle = 11;
width = 12.9;
length = 17;

// Shape
module straightbit(){
	rotate([0,0,-angle])
	translate([rtop-ttop,0,0]){
		linear_extrude(height=width)
		polygon([[0,0],
			[0,0],
			[ttop,0],
			[ttop,length],
			[ttop-tbottom,length]]);
		translate([ttop-dblister/2,length])
		cylinder(r=dblister/2,h=width,$fn=12);
	}
}

union(){
	difference(){
		cylinder(r=rtop,h=width,$fn=24);
		translate([0,0,-1]) cylinder(r=rtop-ttop,h=width+2,$fn=24);
		rotate([0,0,-angle]) translate([-rtop,0,-1]) cube([2*rtop,rtop,width+2]);
		rotate([0,0,angle]) translate([-rtop,0,-1]) cube([2*rtop,rtop,width+2]);
	}
	straightbit();
	mirror([1,0,0]) straightbit();
}