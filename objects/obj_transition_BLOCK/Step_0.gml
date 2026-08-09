if (place_meeting(x,y,obj_player) && !instance_exists(obj_transition))
{
<<<<<<< HEAD
	persistent = true
	var _transition = instance_create_depth(0,0,-666, obj_transition)		//cria transicao em  acima de tudo!
=======
	persistent = true;
	var _transition = instance_create_depth(0,0,-666, obj_transition)		//cria objeto em camada acima de tudo!
>>>>>>> e22b3bf7055ac8c94336b64906bc2e7e4254158c
	_transition.targetROOM_x = targetROOM_x;
	_transition.targetROOM_y = targetROOM_y;
	_transition.target_ROOM = target_ROOM;
	instance_destroy();
<<<<<<< HEAD
}


=======
	
}
>>>>>>> e22b3bf7055ac8c94336b64906bc2e7e4254158c
