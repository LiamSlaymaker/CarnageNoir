if(!initialized){
	switch(image_angle){
		case 0:
			x_dir = 1;
			y_dir = 0;
			break;
		case 90:
			x_dir = 0;
			y_dir = -1;
			break;
		case 180:
			x_dir = -1;
			y_dir = 0;
			break;
		case 270:
			x_dir = 0;
			y_dir = 1;
			break;
	}
	initialized = true;
}