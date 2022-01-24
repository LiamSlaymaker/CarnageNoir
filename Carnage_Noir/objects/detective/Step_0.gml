
my_angle=point_direction(x,y,mouse_x,mouse_y)
if reload>0 reload-=1

up = -keyboard_check(ord("W"))
down = keyboard_check(ord("S"))
left = -keyboard_check(ord("A"))
right = keyboard_check(ord("D"))

if (move) {
horiz = (left + right) * walkSpeed
verti = (up + down) * walkSpeed

if (place_meeting(x + horiz, y, solid_object))
{
	while (!place_meeting(x + sign(horiz), y, solid_object)) {
		x += sign(horiz)
		show_debug_message("HORIZ BUG");
	}
	horiz = 0;
}

x+= horiz

if (place_meeting(x, y + verti, solid_object))
{
	while (!place_meeting(x , y + sign(verti), solid_object)){
		y += sign(verti)
		show_debug_message("VERTI BUG");
	}
	verti = 0;
}

y += verti

arrowDir = point_direction(x, y, obj_hBox.x, obj_hBox.y) * pi /180
arrow.x = (20 * (cos(arrowDir))) + x
arrow.y =  y - (20 * (sin(arrowDir)))
//arrow.x = x;
//arrow.y = y;


if horiz == 0 && verti == 0
	index=0
}

//if (detective.y > 500)
	