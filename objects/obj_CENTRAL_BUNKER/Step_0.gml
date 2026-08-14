
if place_meeting(x,y,obj_player)
{
	recarga=4000
	if (global.terra == valid_terra)
	{
	audio_play_sound(sfx_hud1,1,false);
	instance_destroy(inst_1T);
	}
	else if (global.terra != valid_terra && global.terra != "")
	{
	audio_play_sound(sfx_Alarm5,1,false);
	draw_text(50,50, "ERROUUUU!!!");
	}

}

