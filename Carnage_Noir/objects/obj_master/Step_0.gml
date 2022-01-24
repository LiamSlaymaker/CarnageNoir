/// @description Insert description here
// You can write your code in this editor
if(mode == "carnage"){
	var ec = 0;
	with(enemy){
		ec++;
	}
	enemy_ct = ec;
	
	if(enemy_ct <= 0){
		fader.transition = 1;
	}
} 
else {
	var ev = 0;
	with(obj_evidence)
	{
		if (!read)
			ev++;
	}
	clue_ct = ev;
	if (clue_ct < 1)
	{
		with (obj_DoorLocked)
			instance_change(door_hor_right, true);
		with (obj_hBox)
			image_xscale = 1.2
			//solid = false;
		with(obj_arrow)
			visible = true;
			//fader.transition = 2;
	}
}

if(room == rm_ending && !ending_sq){
	alarm[0] = 10 * room_speed;
	ending_sq = true;
}