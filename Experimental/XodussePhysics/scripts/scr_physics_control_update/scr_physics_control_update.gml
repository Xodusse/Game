///@desc scr_physics_control_update

var N = instance_number(physics_parent)-1;
for(var I = 0;I<N;I++)
{
	var I1,I2;
	I1 = instance_find(physics_parent,I);
	
	for(var C = N;C>I;C--)
	{
		I2 = instance_find(physics_parent,C);
		
		var CT,CX,CY,CL,CW;
		CT = I1.physics_radius+I2.physics_radius;
		CX = I1.x+I1.physics_speed_x*Delta-I2.x-I2.physics_speed_x*Delta;
		CY = I1.y+I1.physics_speed_y*Delta-I2.y-I2.physics_speed_y*Delta;
		CL = point_distance(CX,CY,0,0);
		
		if (CL<CT)
		{
			CW = I1.physics_weight/I2.physics_weight;
			I1.physics_col_x += CX/CL*(CT-CL)/2;
			I1.physics_col_y += CY/CL*(CT-CL)/2;
	
			I2.physics_col_x -= CX/CL*(CT-CL)/2;
			I2.physics_col_y -= CY/CL*(CT-CL)/2;
		}
	}
	
	I1.physics_speed_x += I1.physics_col_x/Delta;
	I1.physics_speed_y += I1.physics_col_y/Delta;
	
	I1.physics_col_x = 0;
	I1.physics_col_y = 0;
}