

if (room == rm_1_terra)
{
	global.valid += 1;
	global.terra = item_id;
	room_goto(rm_minigame);
	
}

if (room == rm_3_air)
{
	global.valid += 2;
	global.air = item_id;	
	room_goto(rm_minigame);
}