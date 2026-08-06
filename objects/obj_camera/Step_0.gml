if not instance_exists(target_) exit;

x = lerp(x, target_.x, 0.1);
y = lerp(y, target_.y-height_/80, 0.1);

ui_padrao = rm_1_terra ||  rm_2_bunker ||rm_3_air

if(room ==  rm_1_terra ||  rm_2_bunker ||rm_3_air){
camera_set_view_pos(view_camera[0], x-width_/2,  y-height_/2.5)} //2,5 pode mudar e talvez nao esteja centralizado, so foi oq deu o melhor feeling
	else if (room == rm_4_agua){camera_set_view_pos(view_camera[0], x,  y-height_/2)}