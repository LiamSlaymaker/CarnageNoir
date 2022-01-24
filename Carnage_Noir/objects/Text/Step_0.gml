lerpProgress += (1- lerpProgress) / 50;
textProgress += 0.55;

x2 = lerp(x2, x2Target, lerpProgress);


image_xscale = x2;

keyUp = keyboard_check_pressed(ord("W"));
keyDown = keyboard_check_pressed(ord("S"));

responseSelected += (keyUp - keyDown);
if (responses != -1)
{
	var _max = array_length_1d(responses) - 1;
	var _min = 0;

	if (responseSelected > _max) 
	responseSelected = _min;
	if (responseSelected < _min)
	responseSelected = _max;
}

if (mouse_check_button_pressed(mb_left))
{
	var _messageLength = string_length(message);
	if (textProgress >= _messageLength)
	{
		if (responses != -1)
		{
			with (originInstance)
				DialougeResponses(other.responseScripts[other.responseSelected]);
		}
		
		instance_destroy();
		if (instance_exists(TextQueued))
		{
			with (TextQueued)
				ticket--;
		}
		else if(room == rm_final)
			player_enemy.move = true;
	}
	else if (textProgress > 2)
		textProgress = _messageLength;
	

}