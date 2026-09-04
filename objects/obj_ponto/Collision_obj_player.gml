if (global.water != item_id && global.air != item_id && global.terra != item_id)
{
if (room == rm_1_terra)
{
    global.binary += 1;
    global.terra = item_id;
    room_goto(rm_minigame);
}

else if (room == rm_3_air)
{
    global.binary += 2;
    global.air = item_id;     
    room_goto(rm_minigame);
}

else if (room == rm_4_agua)
{
    global.binary += 3;
    global.water = item_id;     
    room_goto(rm_minigame);
}
}