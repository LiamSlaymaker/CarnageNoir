//draw textBox

//NineSliceBox(textBox, x1, y1, x2, y2, 0);

//draw_sprite_stretched(textBox, 0, 320, 640, y1, y2)

//draw_sprite_ext(textBox, 0, 320, 410 , xScale, 5, 0, c_white, 1)

if(room == rm_final){
	y1 = 255;
}

Text.x = x1
Text.y = y1


draw_set_font(Fn_Text);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_black);

var _print = string_copy(message, 1, textProgress);

_print += "\n"

if string_length(message) 
	image_yscale = 3
if (responses != -1 )
{
	image_yscale = 4.3
	if (textProgress >= string_length(message))
	{
		for (var i = 0; i < array_length_1d(responses); i++)
		{
			_print += "\n";
			if (i == responseSelected)
				_print += "> ";
			_print += responses[i];
			if (i == responseSelected)
				_print += " <";
		}
		
	}
}
//_print = string(x) + string(y);
draw_self()

draw_text_ext(x1, y1-(10 * image_yscale), _print,strHeight, sprite_width - 50);
//draw_text_ext(x, y, _print,strHeight, sprite_width);
