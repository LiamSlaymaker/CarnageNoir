if(gun == -1 && other.speed < 2){
	if(mouse_check_button_pressed(mb_right)){
		sound_play(click)
		with other instance_destroy()
		fire_spr=fire1_spr
		switch(other.ammo_type){
		case "mg":
			gun = 0;
			gun_to_drop = gun_drop;
			player_ammo = other.ammo_ct;
			sprite_index=subgun_spr;
			break;
		case "sg":
			gun = 1;
			gun_to_drop = gun_drop_sg;
			player_ammo = other.ammo_ct;
			sprite_index=n_shotgun_spr;
			break;
		case "ssg":
			gun = 2;
			gun_to_drop = gun_drop_ssg;
			player_ammo = other.ammo_ct;
			sprite_index=sshotgun_spr;
			break;
		case "ft":
			gun = 3;
			gun_to_drop = gun_drop_ft;
			player_ammo = other.ammo_ct;
			sprite_index=fthrower_spr;
			break;
		case "mini_g":
			gun = 4;
			gun_to_drop = gun_drop_mini_g;
			player_ammo = other.ammo_ct;
			sprite_index=minigun_spr;
			break;
		}
	}
}
