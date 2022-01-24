if other.swing_speed>0 or other.swing_speed<0 
{
	other.image_index=1
	dead_dir = other.swing_speed / 10;
	instance_destroy();
}