if (room == rm_minigame)
{
    visible = false;
    instance_deactivate_object(obj_player); // desliga Step e colisões também
}

if (room != rm_minigame)
{
    visible = true;
    instance_activate_object(obj_player);
}