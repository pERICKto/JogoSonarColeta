if (room == rm_minigame)
{
    visible = false;
    instance_deactivate_object(obj_camera); // desliga Step e colisões também
} 

else
{
	if (instance_exists(obj_player))
	{
    visible = true;
    instance_activate_object(obj_camera);
	}
}
