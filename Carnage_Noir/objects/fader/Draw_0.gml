if restart==0 && transition==0
{
	if alpha>0 
	{
		alpha-=0.01
		draw_set_alpha(alpha)
		draw_set_color(c_black)
		draw_rectangle(0,0,room_width,room_height,0)
		draw_set_alpha(1)
	}
}
if restart==1
{
	if alpha<1 alpha+=0.01 else {/*surface_free(blood_draw.blood_surface)*/ room_restart()}
	draw_set_alpha(alpha)
	draw_set_color(c_black)
	draw_rectangle(0,0,room_width,room_height,0)
	draw_set_alpha(1)
}

if(transition == 1){
	if(alph_switch == 0){
		if alpha<1 {
			alpha+=0.01 
		} 
		else {
			if(room != rm_Level3 && room != rm_final){
				with(dead_patroller){
					sprite_index = spr_bodychalk;
				}
				with(dead_dog){
					instance_destroy();
				}
			} else {
				with(conveyor_belt){
					conveyor_speed = 0;
					image_speed = 0;
				}
			}
			
			if(room == rm_Level2){
				instance_activate_object(obj_DetectiveCar);
			}
			
			with(dead_player){
				instance_destroy();
			}
			
			if(room = rm_ending){
				if(obj_master.winner == "dt"){
					layer_set_visible("layer_DTwin",true);
				} else if(obj_master.winner == "cg") {
					layer_set_visible("layer_CGwin",true);
				} else {
					layer_set_visible("layer_NOwin",true);
				}
			}
			instance_deactivate_object(player);
			instance_activate_object(detective);
			//enable crime scene elements
			//set camera size
			if instance_exists(obj_evidence)
			{
				with(obj_evidence)
					visible = true;
			}
			var cam = view_get_camera(0);
			if(room != rm_final && room != rm_ending){
				camera_set_view_size(cam, 320, 240);
			}
			obj_master.mode = "detective";
			layer_set_visible("layer_policeStuff", true);
			alph_switch++;
		}
	} else if(alph_switch == 1) {
		if alpha>0 {
			alpha-=0.01 
		}
	}
	draw_set_alpha(alpha)
	draw_set_color(c_black)
	draw_rectangle(0,0,room_width,room_height,0)
	draw_set_alpha(1)
}

if (transition == 2)
{
	if(alph_switch == 1){
		if alpha<1 {
			alpha+=0.01 
		} 
		else {
			//with(dead_patroller){
				//sprite_index = spr_bodychalk;
			//}
			//with(dead_dog){
				//instance_destroy();
			//}
			room_goto_next();
			
			instance_deactivate_object(detective);
			instance_activate_object(player);
			//enable crime scene elements
			//set camera size
			//if instance_exists(obj_evidence)
			//{
			//	with(obj_evidence)
			//		visible = true;
			//}
			//var cam = view_get_camera(0);
			//camera_set_view_size(cam, 320, 240);
			obj_master.mode = "carnage";
			//layer_set_visible("layer_policeStuff", true);
			alph_switch--;
		}
	} else if(alph_switch == 0) {
		if alpha>0 {
			alpha-=0.01 
		}
	}
	draw_set_alpha(alpha)
	draw_set_color(c_black)
	draw_rectangle(0,0,room_width,room_height,0)
	draw_set_alpha(1)
}
/* */
/*  */

if(transition == 3){
	if(alph_switch == 1){
		if alpha<1 {
			alpha+=0.01 
		} 
		else {
			game_restart();
		}
	} else if(alph_switch == 0) {
		if alpha>0 {
			alpha-=0.01 
		}
	}
	draw_set_alpha(alpha)
	draw_set_color(c_black)
	draw_rectangle(0,0,room_width,room_height,0)
	draw_set_alpha(1)
}