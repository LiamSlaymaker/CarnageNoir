if instance_exists(player)
{
	with (player)
		move = true
}

else if instance_exists(detective)
{
	with (detective)
		move = true
}
surface_resize(application_surface, 1280, 960)