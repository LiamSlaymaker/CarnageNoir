x1 = 320;
y1 = 410; 
x2 = 0

x2Target = 20;

lerpProgress = 0;
textProgress = 0;

//message = "Test Message";
//responses = -1
//responses = ["Test Response", "Test Response 2"];
responseSelected = 0;

//strHeight= string_height(message);
strHeight = 12

if instance_exists(player)
{
	with (player)
		move = false
}

else if instance_exists(detective)
{
	with (detective)
		move = false
}
surface_resize(application_surface, 640, 480)