// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_debug_message(text_to_print, draw_x, draw_y){
	if(room == rm_Level1){
		var scale = 1.5;
	} else {
		var scale = 1.5;
	}
	draw_set_halign(fa_left);
	draw_text_transformed_color(draw_x, draw_y,string(text_to_print),scale,scale,0,c_red,c_red,c_red,c_red,1);
}