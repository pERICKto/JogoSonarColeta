if (instance_exists(obj_transition))
{
    // transição rolando -> limpa tudo
    rm_check = 0;
    analise = false;
}
else
{
    if (room == rm_2_bunker)
    {
        rm_check = 2;
        analise = obj_player.bunker;
    }
    else if (room == rm_1_terra)
    {
        rm_check = 1;
        analise = false;
    }
    else if (room == rm_3_air)
    {
        rm_check = 3;
        analise = false;
    }
    else if (room == rm_4_agua)
    {
        rm_check = 4;
        analise = false;
    }
    else
    {
        rm_check = 0;
        analise = false;
    }
}