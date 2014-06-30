module front_module_positioner(x, y, z)
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

			translate([0,((y/2) + 5), 0])
			{
				cube([10, 10, z], center = true);
			}

			translate([-10, -((y/2) + 5), 0])
			{
				cube([10, 10, z], center = true);
			}

			translate([10, -((y/2) + 5), 0])
			{
				polyhedron(points = [[10, 10, 0], [10, -10, 0], [-10, -10, 0], [-10, 10, 0], [0, 0, 10]], faces = [[0, 1, 4], [1, 2, 4], [2, 3, 4], [3, 0, 4], [1, 0, 3], [2, 1, 3]]);
			}
		}
	}
}

front_module_positioner(30, 10, 3);