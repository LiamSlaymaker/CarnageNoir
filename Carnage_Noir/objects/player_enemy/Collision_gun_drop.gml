if(gun == -1 && other.speed < 2){
	if(mouse_check_button_pressed(mb_right)){
		sound_play(click)
		with other instance_destroy()
		fire_spr=fire1_spr
		sprite_index=subgun_spr
		switch(other.ammo_type){
		case "mg":
			gun = 0;
			break;
		case "sg":
			gun = 1;
			break;
		case "ssg":
			gun = 2;
			break;
		case "ft":
			gun = 3;
			break;
		case "mini_g":
			gun = 4;
			break;
		}
	}
}
