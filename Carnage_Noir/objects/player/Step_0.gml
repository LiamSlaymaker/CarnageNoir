my_angle=point_direction(x,y,mouse_x,mouse_y)
if reload>0 reload-=1


up = -keyboard_check(ord("W"))
down = keyboard_check(ord("S"))
left = -keyboard_check(ord("A"))
right = keyboard_check(ord("D"))

if (move) {
	horiz = (left + right) * walkSpeed
	verti = (up + down) * walkSpeed
	
	if(!place_meeting(x,y,conveyor_belt)){
		convey_x = 0;
		convey_y = 0;
	}
	
		horiz += convey_x;
		verti += convey_y;

	if (place_meeting(x + horiz, y, solid_object))
	{
		while (!place_meeting(x + sign(horiz), y, solid_object)) {
			x += sign(horiz)
			show_debug_message("PLAYER HORIZ BUG");
		}
		horiz = 0;
	}

	x+= horiz

	if (place_meeting(x, y + verti, solid_object))
	{
		while (!place_meeting(x , y + sign(verti), solid_object)) {
			y += sign(verti)
			show_debug_message("PLAYER VERTI BUG");
		}
		verti = 0;
	}

	y += verti

	if horiz == 0 && verti == 0
		index=0
}

