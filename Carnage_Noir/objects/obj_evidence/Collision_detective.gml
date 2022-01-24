//Check if dectective has touched the evidence and has pressed space, then calls the text box
if mouse_check_button_pressed(mb_left) && (!read)
{

	NewTextBox(string1[0],string1[1]);
	read = true;
}