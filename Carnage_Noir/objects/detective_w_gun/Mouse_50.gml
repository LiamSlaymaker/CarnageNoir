if(instance_exists(player_enemy)){
	if(player_enemy.move){
		if reload=0
		{
			if gun=0 //machine gun
			{
			reload=4
			bull_shoot=collision_line(x,y,x+lengthdir_x(36,my_angle),y+lengthdir_y(36,my_angle),wall,0,1)
			if bull_shoot<0
			{
			my_bull=instance_create(x+lengthdir_x(36,my_angle),y+lengthdir_y(36,my_angle),bullet)
			my_bull.direction=my_angle-7+random(14)
			my_bull.speed=10
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
			sound_player.play_mg=1
			}
		}
	}
}