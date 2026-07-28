	//movimentação basica!!
	if keyboard_check_pressed(vk_up){
		y -= spd;
	}
	if keyboard_check_pressed(vk_down){
		y += spd;
	}
	if keyboard_check_pressed(vk_right){
			x +=  spd;
		}
		if keyboard_check_pressed(vk_left){
			x -= spd;
		}
		
		// Se pressionar espaço e não houver um pulso ativo (opcional)
if (keyboard_check_pressed(vk_space)) {
    // Toca um efeito sonoro de sonar (se tiver)
    // audio_play_sound(snd_sonar, 1, false);
    
    // Instancia o pulso na posição do player
    instance_create_layer(x, y, "Instances", obj_Sonar_player);
}