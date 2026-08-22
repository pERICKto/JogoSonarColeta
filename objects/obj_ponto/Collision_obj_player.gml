if (room == rm_1_terra)
{
    global.valid += 1;
    global.terra = item_id;
    global.binario_atual = meu_binario; 
    room_goto(rm_minigame);
}

if (room == rm_3_air)
{
    global.valid += 2;
    global.air = item_id;    
    global.binario_atual = meu_binario; 
    room_goto(rm_minigame);
}