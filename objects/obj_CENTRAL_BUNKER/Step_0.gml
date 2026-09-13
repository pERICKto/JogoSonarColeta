if place_meeting(x, y, obj_player)
{
    
    // sistema de regarga de pilha do bunker!!
    if (global.bateria_atual <= 4000) {
        recarga += 10;
    }
    
    // AMOSTRA CERTA - TERRA!
    if (global.terra == global.valid_terra) 
	{    
        instance_destroy(inst_1T);
        if (scan == false) 
		{
            if (estado_amostra == 0) 
			{
                audio_play_sound(sfx_amostra_bunker, 2, false);
                estado_amostra = 1; // Trava e passa para a próxima fase
            }
            else if (estado_amostra == 1) 
			{
                
                if (!audio_is_playing(sfx_amostra_bunker)) 
				{
                    audio_play_sound(sfx_spawBUNKER_ou_desceramostra, 3, false);
                    scan = true;
                    // libera pra próxima amostra e soma no total de validadas
					global.valid += 1;
					global.terra = "";
					global.valid_terra = "usado";
					scan = false;
					estado_amostra = 0; // pronto pra validar a próxima
                }
            }
        }
    }
    
    //AMOSTRA ERRADA - TERRA!
    else if (global.terra != global.valid_terra && global.terra != "")
	{
        // Toca o alarme apenas se ele já não estiver tocando
        if (!audio_is_playing(sfx_Alarm5))
		{
            audio_play_sound(sfx_Alarm5, 1, false);
		}
        
    }
	
	// AMOSTRA CERTA - AR!
	else if (global.air == global.valid_air)
	{    
        instance_destroy(inst_3A);
        if (scan == false) 
		{
            if (estado_amostra == 0) 
			{
                audio_play_sound(sfx_amostra_bunker, 2, false);
                estado_amostra = 1; // Trava e passa para a próxima fase
            }
            else if (estado_amostra == 1) 
			{
                
                if (!audio_is_playing(sfx_amostra_bunker)) 
				{
                    audio_play_sound(sfx_spawBUNKER_ou_desceramostra, 3, false);
                    scan = true;
                    // libera pra próxima amostra e soma no total de validadas
					global.valid += 1;
					global.air = "";
					global.valid_air = "usado";
					scan = false;
					estado_amostra = 0; // pronto pra validar a próxima
                }
            }
			
        }
	}
	
	//AMOSTRA ERRADA - AR!
	else if (global.air != global.valid_air && global.air != "")
	{
        // Toca o alarme apenas se ele já não estiver tocando
        if (!audio_is_playing(sfx_Alarm5))
		{
            audio_play_sound(sfx_Alarm5, 1, false);
		}
        
    }
	
	// AMOSTRA CERTA - ÁGUA!
	else if (global.water == global.valid_water)
	{    
        instance_destroy(inst_4W);
        if (scan == false) 
		{
            if (estado_amostra == 0) 
			{
                audio_play_sound(sfx_amostra_bunker, 2, false);
                estado_amostra = 1; // Trava e passa para a próxima fase
            }
            else if (estado_amostra == 1) 
			{
                
                if (!audio_is_playing(sfx_amostra_bunker)) 
				{
                    audio_play_sound(sfx_spawBUNKER_ou_desceramostra, 3, false);
                    scan = true;
                    // libera pra próxima amostra e soma no total de validadas
					global.valid += 1;
					global.water = "";
					global.valid_water = "usado";
					scan = false;
					estado_amostra = 0; // pronto pra validar a próxima
                }
            }
			
        }
	}
	
	//AMOSTRA ERRADA - ÁGUA!
	else if (global.water != global.valid_water && global.water != "")
	{
        // Toca o alarme apenas se ele já não estiver tocando
        if (!audio_is_playing(sfx_Alarm5))
		{
            audio_play_sound(sfx_Alarm5, 1, false);
		}
        
    }
	
}

// checagem de vitória - roda todo frame, independente do place_meeting
if (global.valid >= 3)
{
    room_goto(rm_victory); // troca pelo nome real da sua room de vitória
}