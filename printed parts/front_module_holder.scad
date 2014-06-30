module module_holder(x, y, z)
{
	//parameters
	padding = 0.1;
	module screw_hole()
	{
		#cylinder(h = (z + padding), r = 1.5, $fn = 10, center = true);
	}

	difference()
	{

		union()
		{
			cube([x, y, z], center = true);
			
			translate([-11, -((y/2) + 5), 0])
			{
				cube([10, 10, z], center = true);
			}

			translate([11, -((y/2) + 5), 0])
			{
				cube([10, 10, z], center = true);
			}
		}

		translate([0, -((y/2) / 1.538), 0])
		{
			#cube([12, 9, (z + padding)], center = true); //VCC trig echo GND will fit this place
		}

		translate([((x/2) - 5), ((y/2) - 3), 0]) //top right
		{
			screw_hole();
		}

		translate([-((x/2) - 5), -((y/2) - 3), 0]) // bottom left
		{
			screw_hole();
		}

		translate([-11, -((y/2) + 7), 0])
		{
			screw_hole();
		}

		translate([11, -((y/2) + 7), 0])
		{
			screw_hole();
		}
	}
}

module_holder(49, 23, 3);