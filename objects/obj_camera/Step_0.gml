if (!instance_exists(target_)) exit;

x = lerp(x, target_.x, 0.1);
y = lerp(y, target_.y - height_ / 80, 0.1);

switch (room) {
    case rm_1_terra:camera_set_view_pos(view_camera[0], x - width_ / 2, y - height_ / 1);
break;
	
    case rm_2_bunker:camera_set_view_pos(view_camera[0], x - width_ / 2, y - height_ / 2.5);
		break;
	
    case rm_3_air:camera_set_view_pos(view_camera[0], x - width_ / 2, y - height_ / 2.5);	
        camera_set_view_pos(view_camera[0], x - width_ / 2, y - height_ / 2.5);
			if (!instance_exists(obj_grid_maker)) {
			   instance_create_layer(0, 0, "Instances", obj_grid_maker);
			 }
	 break;
	
    case rm_4_agua:
        camera_set_view_pos(view_camera[0], x - width_ / 2, y - height_ / 2);
    break;
}