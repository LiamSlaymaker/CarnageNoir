image_xscale = 1;
image_yscale = 1;
var camera = view_get_camera(0);

x=camera_get_view_x(camera) + (camera_get_view_width(camera) / 2);
y=camera_get_view_y(camera) + (camera_get_view_height(camera) / 2);
draw_set_blend_mode(bm_subtract)
draw_my_sprite()
draw_set_blend_mode(bm_normal)
