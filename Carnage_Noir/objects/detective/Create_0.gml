index=0
move=0
reload=0
energie=1
my_angle=0
fire_spr=fire1_spr
gun=-1
holding=0
minigun=0

arrow = instance_create_layer(x + 5, y, "layer_crosshair", obj_arrow)

move = true
walkSpeed = 1.5

stuck = false;

instance_deactivate_object(self);

