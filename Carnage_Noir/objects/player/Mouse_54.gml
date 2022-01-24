if(gun >= 0){
	var gunDrop = instance_create_layer(x,y,"layer_weaponsNdoors",gun_to_drop);
	switch(gun){
		case 0:
			gunDrop.ammo_type = "mg";
			gunDrop.ammo_ct = player_ammo;
			player_ammo = 0;
			break;
		case 1:
			gunDrop.ammo_type = "sg";
			gunDrop.ammo_ct = player_ammo;
			player_ammo = 0;
			break;
		case 2:
			gunDrop.ammo_type = "ssg";
			gunDrop.ammo_ct = player_ammo;
			player_ammo = 0;
			break;
		case 3:
			gunDrop.ammo_type = "ft";
			gunDrop.ammo_ct = player_ammo;
			player_ammo = 0;
			break;
		case 4:
			gunDrop.ammo_type = "mini_g";
			gunDrop.ammo_ct = player_ammo;
			player_ammo = 0;
			break;
	}
	gunDrop.speed = 10;
	gunDrop.friction = 0.2;
	gunDrop.direction = my_angle;
	gunDrop.thrown = true;
	sprite_index=unarmed
	gun = -1;
}

//if place_meeting(x,y,solid_object)
//	{
//		//var move_dir_x = lengthdir_x(5,point_direction(x,y,player.x,player.y));
//		//var move_dir_y = lengthdir_y(5,point_direction(x,y,player.x,player.y));
//		//while(place_meeting(x,y,solid_object)){
//		//	x += move_dir_x;
//		//	y += move_dir_y;
//		//}
//		speed=1+random(0.5)
//		dir_change=-1+round(random(1))*2
//	} else {
//		speed = 10;
//		dir_change = -0.3;
//		thrown = 1;
//	}
//	friction=0.2
//	direction=player.my_angle;
//	player.gun=-1
//	on=0