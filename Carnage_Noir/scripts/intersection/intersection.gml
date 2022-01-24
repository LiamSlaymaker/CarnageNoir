function intersection(argument0, argument1, argument2, argument3, argument4) {
	if argument4=0 {
		return -100
		exit
	}
	dist=point_distance(argument0,argument1,argument2,argument3)
	dir=point_direction(argument0,argument1,argument2,argument3)
	my_x=argument0
	my_y=argument1
	addx=lengthdir_x(argument4,dir)
	addy=lengthdir_y(argument4,dir)
	var i=0
	show_debug_message("RAN INTERSECTION");
	while collision_point(my_x,my_y,wall,0,1)<0 and i<dist/argument4
	{
		my_x+=addx
		my_y+=addy
		i+=1
	}
	if i<dist/argument4 {
		return 1
	} else {
		return -100
	}

 // IF YOU WANT THE ENEMY TO NOT SHOOT WHEN SOMETHING IS IN THE WAY YOU HAVE TO MARK IT AS A solid_object!!!

}
