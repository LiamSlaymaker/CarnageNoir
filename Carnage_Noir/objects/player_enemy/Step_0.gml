//index += 0.25
if(instance_exists(detective_w_gun)){
	my_angle=point_direction(x,y,detective_w_gun.x,detective_w_gun.y);
}
if reload>0 reload-=1


//up = -keyboard_check(ord("W"))
//down = keyboard_check(ord("S"))
//left = -keyboard_check(ord("A"))
//right = keyboard_check(ord("D"))

if (move) {
	x += walkSpeed / 2 * walk_dir;
	y += walkSpeed;
	index += 0.25;
	
	if(x <= 272){
		walk_dir = 1;
	} else if (x >= 368){
		walk_dir = -1;
	}
	
	if(instance_exists(dead_detective)){
		move = false;
	}
	//horiz = (left + right) * walkSpeed
	//verti = (up + down) * walkSpeed
	
	//if(!place_meeting(x,y,conveyor_belt)){
	//	convey_x = 0;
	//	convey_y = 0;
	//}
	
	//	horiz += convey_x;
	//	verti += convey_y;

	//if (place_meeting(x + horiz, y, solid_object))
	//{
	//	while (!place_meeting(x + sign(horiz), y, solid_object)) {
	//		x += sign(horiz)
	//		show_debug_message("PLAYER HORIZ BUG");
	//	}
	//	horiz = 0;
	//}

	//x+= horiz

	//if (place_meeting(x, y + verti, solid_object))
	//{
	//	while (!place_meeting(x , y + sign(verti), solid_object)) {
	//		y += sign(verti)
	//		show_debug_message("PLAYER VERTI BUG");
	//	}
	//	verti = 0;
	//}

	//y += verti

	//if horiz == 0 && verti == 0
	//	index=0
}