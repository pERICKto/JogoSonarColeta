
if (room == rm_1_terra)
{
    global.binary += 1;
    global.terra = item_id;
    room_goto(rm_minigame);
}

if (room == rm_3_air)
{
    global.binary += 2;
    global.air = item_id;     
    room_goto(rm_minigame);
}

if (room == rm_4_agua)
{
    global.binary += 3;
    global.air = item_id;     
    room_goto(rm_minigame);
}