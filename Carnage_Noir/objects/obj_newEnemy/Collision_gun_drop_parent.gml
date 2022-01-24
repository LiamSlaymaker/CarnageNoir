if door_hit=0
{
	if other.thrown{
		if other.speed>2 sound_play(throw_hit)
		if other.speed>4
		{
		door_hit=1
		index=0
		sprite_index=get_up
		direction=other.direction
		my_speed=2+random(2)
		if armed=1
		{
		armed=0
		my_i=instance_create(x,y,gun_to_drop)
		my_i.ammo_type = ammo_type;
		my_i.image_angle=direction
		my_i.direction=direction-180-20+random(40)
		my_i.speed=1+random(0.5)
		}
		}
		other.speed=other.speed/2
		other.direction-=180-20+random(40)
	} else if(armed == 0) {
		sound_play(click)
		ammo_type = other.ammo_type;
		armed=1
		switch(ammo_type){
			case "mg":
				gun_to_drop = gun_drop;
				sprite_index = soldier;
				break;
			case "sg":
				gun_to_drop = gun_drop_sg;
				sprite_index = spr_EnemyPumpShotgun;
				break;
			case "ssg":
				gun_to_drop = gun_drop_ssg;
				sprite_index = spr_EnemyAutoShotgun;
				break;
			case "ft":
				gun_to_drop = gun_drop_ft;
				sprite_index = spr_EnemyFlameThrower;
				break;
			case "mini_g":
				gun_to_drop = gun_drop_mini_g;
				sprite_index = spr_EnemyMinigun;
				break;
		}
		with other instance_destroy()
	}
}
