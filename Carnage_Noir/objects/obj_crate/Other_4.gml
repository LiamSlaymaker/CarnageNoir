if(!init){
	if(!open){
		var rand_int = floor(random(4));
		while(rand_int == 1 || rand_int == 4){
			rand_int = floor(random(4));
		}
		image_index=rand_int;
	} else {
		var which = floor(random(2));
		if(which){
			image_index = 1;
		} else {
			image_index = 4;
		}
	}
	init = true;
}