my_i=instance_create(x,y,dead_detective)
my_i.image_angle=dead_dir
my_i.direction=dead_dir
my_i.speed=2

var my_hat = instance_create(x,y,hat)
my_hat.image_angle = dead_dir;
my_hat.direction = dead_dir;
my_hat.speed = 3;
my_hat.depth = my_i.depth - 1;
with aim visible=0

obj_master.winner = "cg";
fader.alarm[0] = 2*room_speed;