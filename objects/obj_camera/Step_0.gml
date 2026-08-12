if (!instance_exists(target_)) exit;

x = lerp(x, target_.x, 0.25);
y = lerp(y, target_.y - height_ / 80, 0.25);
// 1. SE O SONAR NÃO EXISTE (Recarregando)
if (!instance_exists(obj_Sonar_player)) {
    
    if (pcr < 100) {
        pcr += 0.5; // Recarrega até o máximo de 100
    }
    
    cor_sonar_raio_hud = c_red; // Cor de recarga / inativo
} 
else {
    
    if (pcr > 0) {
        pcr -= 1; // Gasta a energia enquanto for maior que 0
    }
    
}

if (pcr = 100){
cor_sonar_raio_hud = c_green;
}


#region	//configuracoes fase 1 terra
switch (room) {
	 case rm_intro:camera_set_view_pos(view_camera[0], x - width_ / 2, y - height_ / 2.5);
	
	break; 
    case rm_1_terra:camera_set_view_pos(view_camera[0], x - width_ / 2, y - height_ / 2.5);
		if (!instance_exists(obj_grid_maker)) {
			instance_create_layer(0, 0, "Instances", obj_grid_maker);
		}
			fallout_gui = true
	break;
	
	//configuracoes fase 2 bunker
    case rm_2_bunker:camera_set_view_pos(view_camera[0], x - width_ / 2, y - height_ / 2.5);
					if (!instance_exists(obj_grid_maker)) {
			   instance_create_layer(0, 0, "Instances", obj_grid_maker);
			}
				fallout_gui = true
	break;
	
	//configuracoes fase 3 coleta de ar
    case rm_3_air:camera_set_view_pos(view_camera[0], x - width_ / 2, y - height_ / 2.5);	
        camera_set_view_pos(view_camera[0], x - width_ / 2, y - height_ / 2.5);
			if (!instance_exists(obj_grid_maker)) {
			   instance_create_layer(0, 0, "Instances", obj_grid_maker);
			 }
				fallout_gui = true
	 break;
	
	//configuracoes fase 4 da [agua
    case rm_4_agua:
        camera_set_view_pos(view_camera[0], x - width_ / 2, y - height_ / 2);
			if (!instance_exists(obj_grid_maker)) {
		instance_create_layer(0, 0, "Instances", obj_grid_maker);
	}
		fallout_gui = true 
    break;

		//configuracoes sala de vitoria!!
	    case rm_victory:
        camera_set_view_pos(view_camera[0], x - width_ / 2, y - height_ / 2);
			if (instance_exists(obj_grid_maker)) {
		instance_destroy(obj_grid_maker);
	}
		fallout_gui = false 
    break;
}

#endregion