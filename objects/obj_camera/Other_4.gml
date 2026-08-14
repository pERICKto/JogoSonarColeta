if (room == rm_minigame)
{
    visible = false;
    instance_deactivate_object(obj_camera); // desliga Step e colisões também
} 

else
{
	if (instance_exists(obj_player))
	{
    visible = true;
    instance_activate_object(obj_camera);
	}
}

// EVENTO: Other > Room Start

switch (room) {
    
    case rm_1_terra:
        if (!instance_exists(obj_grid_maker)) {
            instance_create_layer(0, 0, "Instances", obj_grid_maker);
        }
        fallout_gui = true;
        break;
        
    //configuracoes fase 2 bunker
    case rm_2_bunker:
        if (!instance_exists(obj_grid_maker)) {
            instance_create_layer(0, 0, "Instances", obj_grid_maker);
        }
        
        //
		if (!instance_exists(obj_batery)) {
            instance_create_layer(0, 0, "Instances", obj_batery);
        }

        fallout_gui = true;
        break;
        
    //configuracoes fase 3 coleta de ar
    case rm_3_air:
        if (!instance_exists(obj_grid_maker)) {
            instance_create_layer(0, 0, "Instances", obj_grid_maker);
        }
        fallout_gui = true;
        break;
        
    //configuracoes fase 4 da [agua
    case rm_4_agua:
        if (!instance_exists(obj_grid_maker)) {
            instance_create_layer(0, 0, "Instances", obj_grid_maker);
        }
        fallout_gui = true; 
        break;

    //configuracoes sala de vitoria!!
    case rm_victory:
        if (instance_exists(obj_grid_maker)) {
            instance_destroy(obj_grid_maker);
        }
        fallout_gui = false; 
        break;
}