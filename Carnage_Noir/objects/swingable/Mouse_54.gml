if !instance_exists(player) exit
if on=1
{
	image_angle = player.my_angle;
	if place_meeting(x,y,solid_object)
	{
		//var move_dir_x = lengthdir_x(5,point_direction(x,y,player.x,player.y));
		//var move_dir_y = lengthdir_y(5,point_direction(x,y,player.x,player.y));
		//while(place_meeting(x,y,solid_object)){
		//	x += move_dir_x;
		//	y += move_dir_y;
		//}
		speed=1+random(0.5)
		dir_change=-1+round(random(1))*2
	} else {
		speed = 10;
		dir_change = -0.3;
		thrown = 1;
	}
	friction=0.2
	direction=player.my_angle;
	player.gun=-1
	on=0
} else {
	if player.gun=-1 and distance_to_object(player)<10
	{
		player.gun=-2
		on=1
	}
}

