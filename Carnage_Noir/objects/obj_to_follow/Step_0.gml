//if(instance_find(player,1) != noone){
if (instance_exists(player) || instance_exists(detective)){
	if(obj_master.mode == "carnage"){
		x = player.x;
		y = player.y;
	} else {
		x = detective.x;
		y = detective.y;
	}
}