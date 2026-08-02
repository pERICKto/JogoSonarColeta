if (place_meeting(x,y,obj_player) && !instance_exists(obj_transition))
{
	var _transition = instance_create_depth(0,0,-666, obj_transition)		//cria objeto em camada acima de tudo!
	_transition.targetROOM_x = target_ROOM_x;
	_transition.targetROOM_y = target_ROOM_y;
	_transition.target_ROOM = target_ROOM;
}