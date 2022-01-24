if(!thrown){
	var x_convey = other.x_dir * other.conveyor_speed;
	var y_convey = other.y_dir * other.conveyor_speed;
	if(!place_meeting(x+x_convey,y,solid_object)){
		x += x_convey;
	}
	if(!place_meeting(x,y+y_convey,solid_object)){
		y += y_convey;
	}
}