if !instantiated {
	if(direction < 180){
		dir_change = 1;
	} else {
		dir_change = -1;
	}
	last=dir_change;
	
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
	instantiated = true;
}

if !instance_exists(player) {
	ammo_load=0
	exit
}

if my_speed>0 && move_type != "sentry" //MOVEMENT AND WALKING ANIMATION (index)
{
	if place_free(x+lengthdir_x(my_speed,my_angle),y) {
		x+=lengthdir_x(my_speed,my_angle)
	}
	if place_free(x,y+lengthdir_y(my_speed,my_angle)) {
		y+=lengthdir_y(my_speed,my_angle)
	}
	if index<8 {
		index+=0.15 //play animation (doesn't matter which one)
	} else {
		index=0
	}
}


if door_hit=1 
{
	ammo_load=0
	my_angle=direction
	if my_speed>0 {
		my_speed-=0.15 
	} else {
		if index<6 {
			index+=0.15 //play getting up animation 
		} else {
			door_hit=0
			direction-=180
			sprite_index=unarmed_soldier
		}
	}
	exit
}

if check_time=0
{
	check_time=5
	if point_distance(x,y,player.x,player.y)<200 
	{
		if intersection(x,y,player.x,player.y,8)<0 //check if anything (with solid_object as the parent) is in the way
		{
			if point_distance(x,y,player.x,player.y)<96 {
				active=1 
			}
			bull_check=instance_nearest(x,y,bullet)
			if bull_check>0 
			{
				if point_distance(bull_check.x,bull_check.y,x,y)<144 and point_distance(x,y,player.x,player.y) { //?
					active=1 
					reload=180
				}
			}
		}
	}
} else {
	check_time-=1
}

if ammo_load>0 { //makes it so there is a bit of a pause between shots when firing (however brief)
	ammo_load-=1
}


if active=1 //ACTIVATED if the player enters the enemy's line of fire
{
	if(move_type == "guard"){
		move_type = "patrol";
	}
	if image_angle>90 and image_angle<270 { //determine which side to shoot towards (horiz)
		dir_change=-1 
	} else {
		dir_change=1
	}
	if point_distance(x,y,player.x,player.y)>112
	{
		if intersection(x,y,player.x,player.y,8)>0 or point_distance(x,y,player.x,player.y)>240 { //unactivate fire mode
			active=0
		}
		turn_toward_direction(point_direction(x,y,player.x,player.y),4)
		if armed=1 {
			my_speed=1 
		} else {
			my_speed=-1
		}
	} else {
		my_speed=0
		turn_toward_direction(point_direction(x,y,player.x,player.y),4)
	}
	
	direction=round(direction/4)*4
	if ammo_load=0 and armed=1 //spawn a bullet and play the machine gun sound effect
	{
		switch(ammo_type){
			case "mg":
				if collision_line(x,y,x+lengthdir_x(40,my_angle),y+lengthdir_y(40,my_angle),solid_object,0,1)<0
				{
					sound_player.play_mg=1
					ammo_load=5
					my_bull=instance_create(x+lengthdir_x(36,my_angle),y+lengthdir_y(36,my_angle),enemy_bullet)
					my_bull.direction=my_angle-5+random(10)
					my_bull.image_angle=my_bull.direction
					my_bull.speed=10
				}
				break;
			case "sg":
				ammo_load=45
				sound_player.play_sg=1
				bull_shoot=collision_line(x,y,x+lengthdir_x(36,my_angle),y+lengthdir_y(36,my_angle),solid_object,0,1)
				if bull_shoot<0
				{
					repeat (12)
					{
						my_bull=instance_create(x+lengthdir_x(40,my_angle),y+lengthdir_y(40,my_angle),enemy_bullet)
						my_bull.direction=my_angle-8+random(16)
						my_bull.speed=12-random(4)
						my_bull.image_angle = my_bull.direction;
					}
				} else {
					repeat (12)
					{
						if bull_shoot.object_index=door_hor_left
						{
							if my_angle<180 {
								bull_shoot.angle_speed+=0.75
							}
							if my_angle>180 {
								bull_shoot.angle_speed+=-0.75
							}
						}
						if bull_shoot.object_index=door_hor_right
						{
							if my_angle<180 {
								bull_shoot.angle_speed+=0.75
							}
							if my_angle>180 {
								bull_shoot.angle_speed+=-0.75
							}
						}
						if bull_shoot.object_index=door_vert_up
						{
							if my_angle>90 and my_angle<270 {
								bull_shoot.angle_speed+=-0.75
							}
							if my_angle<90 or my_angle>270 {
								bull_shoot.angle_speed+=0.75
							}
						}
						if bull_shoot.object_index=door_vert_down
						{
							if my_angle>90 and my_angle<270 {
								bull_shoot.angle_speed+=0.75
							}
							if my_angle<90 or my_angle>270 {
								bull_shoot.angle_speed+=-0.75
							}
						}
					}
				}
				break;
			case "ssg":
				ammo_load=15
				sound_player.play_ssg=1
				bull_shoot=collision_line(x,y,x+lengthdir_x(36,my_angle),y+lengthdir_y(36,my_angle),solid_object,0,1)
				if bull_shoot<0
				{
					repeat (8)
					{
						my_bull=instance_create(x+lengthdir_x(40,my_angle),y+lengthdir_y(40,my_angle),enemy_bullet)
						my_bull.direction=my_angle-8+random(16)
						my_bull.speed=12-random(4)
						my_bull.image_angle = my_bull.direction;
					}
				}
				else
				{
					repeat (12)
					{
						if bull_shoot.object_index=door_hor_left
						{
							if my_angle<180 {
								bull_shoot.angle_speed+=0.75
							}
							if my_angle>180 {
								bull_shoot.angle_speed+=-0.75
							}
						}
						if bull_shoot.object_index=door_hor_right
						{
							if my_angle<180 {
								bull_shoot.angle_speed+=0.75
							}
							if my_angle>180 {
								bull_shoot.angle_speed+=-0.75
							}
						}
						if bull_shoot.object_index=door_vert_up
						{
							if my_angle>90 and my_angle<270 {
								bull_shoot.angle_speed+=0.75
							}
							if my_angle<90 or my_angle>270 {
								bull_shoot.angle_speed+=-0.75
							}
						}
						if bull_shoot.object_index=door_vert_down
						{
							if my_angle>90 and my_angle<270 {
								bull_shoot.angle_speed+=-0.75
							}
							if my_angle<90 or my_angle>270 {
								bull_shoot.angle_speed+=0.75
							}
						}
					}
				}
				break;
			case "ft":
				if collision_line(x,y,x+lengthdir_x(32,my_angle),y+lengthdir_y(36,my_angle),solid_object,0,1)<0
				{
					ammo_load = 1
					my_bull=instance_create(x+lengthdir_x(28,my_angle),y+lengthdir_y(28,my_angle),enemy_flame);
					my_bull.direction=my_angle-5+random(10);
					my_bull.speed=4;
					my_bull.image_xscale = 0.19;
					my_bull.image_yscale = 0.19;
					my_bull.image_angle=random(360)
				}
				break;
			case "mini_g":
				ammo_load=1
				if minigun<2 minigun+=1 else minigun=0
					bull_shoot=collision_line(x,y,x+lengthdir_x(36,my_angle),y+lengthdir_y(36,my_angle),solid_object,0,1)
					my_cart=instance_create(x+lengthdir_x(18,my_angle-10),y+lengthdir_y(18,my_angle-10),cartridge)
					my_cart.direction=my_angle-110+random(20)
					my_cart.speed=1+random(2)
					my_cart.image_index=0
				if bull_shoot<0
				{
					my_bull=instance_create(x+lengthdir_x(36,my_angle),y+lengthdir_y(36,my_angle),enemy_bullet)
					my_bull.direction=my_angle-7+random(14)
					my_bull.speed=10
					my_bull.image_angle = my_bull.direction
				}
				else
				{
				if bull_shoot.object_index=door_hor_left
				{
				if my_angle<180 bull_shoot.angle_speed+=0.75
				if my_angle>180 bull_shoot.angle_speed+=-0.75
				}
				if bull_shoot.object_index=door_hor_right
				{
				if my_angle<180 bull_shoot.angle_speed+=0.75
				if my_angle>180 bull_shoot.angle_speed+=-0.75
				}
				if bull_shoot.object_index=door_vert_up
				{
				if my_angle>90 and my_angle<270 bull_shoot.angle_speed+=-0.75
				if my_angle<90 or my_angle>270 bull_shoot.angle_speed+=0.75
				}
				if bull_shoot.object_index=door_vert_down
				{
				if my_angle>90 and my_angle<270 bull_shoot.angle_speed+=0.75
				if my_angle<90 or my_angle>270 bull_shoot.angle_speed+=-0.75
				}
				}
				sound_player.play_minishoot=1
				break;
		}
		
			
	}
	bull_check=instance_nearest(x,y,bullet)
	if bull_check>0 //makes the enemy strafe away from bullets
	{
		if bull_check.direction-point_direction(bull_check.x,bull_check.y,x,y)>0
		{
			if place_free(x+lengthdir_x(1,bull_check.direction-90),y) {
				x+=lengthdir_x(1,bull_check.direction-90)
			}
			if place_free(x,y+lengthdir_y(1,bull_check.direction-90)) {
				y+=lengthdir_y(1,bull_check.direction-90)
			}
		} else {
			if place_free(x+lengthdir_x(1,bull_check.direction+90),y) {
				x+=lengthdir_x(1,bull_check.direction+90)
			}
			if place_free(x,y+lengthdir_y(1,bull_check.direction+90)) {
				y+=lengthdir_y(1,bull_check.direction+90)
			}
		}
	}
}


if active=0
{
	find=instance_nearest(x,y,dead_patroller)
	if find>0 //look for dead bodies and react if you find any
	{
		if distance_to_object(find)<50 and aware=0 
		{
			if intersection(x,y,find.x,find.y,solid_object)<0  {
				my_dir=90
				face_dir=direction
				aware=1
				active=2
				exit
			}
		}
	}
	direction=round(direction/5)*5
	#region //MOVEMENT while patrolling!!!
	if(move_type == "patrol"){
		if !place_free(x+lengthdir_x(16,direction),y+lengthdir_y(16,direction)) and reload=0 {
			direction+=5*dir_change
			last=1
			reload=15
		} else {
			if place_free(x+lengthdir_x(24,direction-90*dir_change),y+lengthdir_y(24,direction-90*dir_change)) and reload=0 {
				last=-1
				reload=30
				direction+=-(5*dir_change)
			}
			if frac(direction/90)>0 {
				direction+=(5*dir_change)*last
			}
		} 
		my_speed=1
	}
	#endregion
	my_angle=direction
	if intersection(x,y,player.x,player.y,4)<0 and collision_circle(x+lengthdir_x(60,my_angle),y+lengthdir_y(60,my_angle),45,player,0,1)>0 {
		active=1
	}
}

if active=2
{
	my_speed=0
	my_angle=face_dir+lengthdir_x(90,my_dir)
	if dir_change>0 {
		if my_dir<450 {
			my_dir+=1.5 
		} else {
			active=0
		}
	} else {
		if my_dir>-270 {
			my_dir-=1.5
		} else {
			active=0
		}
	}
	if intersection(x,y,player.x,player.y,8)<0 and collision_line(x,y,x+lengthdir_x(120,my_angle),y+lengthdir_y(120,my_angle),player,0,1)>=0 {
		replace=1
		instance_destroy()
		// idk what this code does tbh
	} 
}

if reload>0 {
	reload-=1
}



if react>0 {
	react-=1
}

if react=1 {
	active=1
}
