// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function NewTextBox(argument0, argument1)
{
	var _obj;
	if (instance_exists(Text))
		_obj = TextQueued;
	else
		_obj = Text;
	
	with(instance_create_layer(0, 0, "layer_CameraEffects", _obj))
	{
		message = argument0;
		if (instance_exists(other))
			originInstance = other.id;
		else
			originInstance = noone;
			
		if (argument1 != 1)
		{
			//trim markers from responses
			
			responses = argument1;
			for (var i = 0; i < array_length_1d(responses); i++)
			{
				var _markerPosition = string_pos(":", responses[i]);
				responseScripts[i] = string_copy(responses[i], 1, _markerPosition - 1)
				responseScripts[i] = real(responseScripts[i]);
				responses[i] = string_delete(responses[i], 1, _markerPosition)
			}
		}
		else
		{
			responses = [-1];
			responseScripts = [-1]
		
		}
	}

}