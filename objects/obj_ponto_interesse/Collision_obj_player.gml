instance_destroy(obj_HUD_inferior);
if (room == rm_1_terra)
{
global.room = 1;
global.terra = item_id;
room_goto(rm_minigame);
}

if (room == rm_3_air)
{
global.room = 2;
global.air = item_id;
room_goto(rm_minigame);
instance_destroy();
}
