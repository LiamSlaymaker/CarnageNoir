if speed=0 and start=0
{
instance_create_layer(x,y,"layer_FloorFX",blood_pool)
start=1
}

if(instance_exists(dead_player)){
	obj_master.winner = "none";
}