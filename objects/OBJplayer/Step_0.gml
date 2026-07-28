	#region	//movimentação boladona!!
	if (keyboard_check_pressed(vk_up)) {

    if (!place_meeting(x, y - spd, OBJS_escaneaveis)) {

        y -= spd;		//LIBERA  movimento pra cima caso nao colida com nada
    }
}
	if keyboard_check_pressed(vk_down){									//fala BAIXO, to trabalhando
		if (!place_meeting(x,y +spd, OBJS_escaneaveis)){
			y += spd;	
		}
	}
																													
	if keyboard_check_pressed(vk_right){										//anda pra baixo se nao ouver colisao
		if (!place_meeting(x +spd,y, OBJS_escaneaveis)){
			x +=  spd;
		}
	}
		if keyboard_check_pressed(vk_left){
			if (!place_meeting(x -spd,y, OBJS_escaneaveis)){
			x -= spd;
			}
		}

if (keyboard_check_pressed(vk_space)) {

    instance_create_layer(x, y, "Instances", obj_Sonar_player);
}     
#endregion

//colisao maneirona!
if place_meeting(15,y,OBJ_PAREDONATESTE){
	while(!place_meeting(x+sign(spd),y,OBJ_PAREDONATESTE))
	x = x+spd;
}