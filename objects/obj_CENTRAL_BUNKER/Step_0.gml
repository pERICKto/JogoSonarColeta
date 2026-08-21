if place_meeting(x, y, obj_player) {
    
    // sistema de regarga de pilha do bunker!!
    if (global.bateria_atual <= 4000) {
        recarga += 10;
    }
    
    // AMOSTRA CERTA!
    if (global.terra == valid_terra) 
	{    
        instance_destroy(inst_1T);
        if (scan == false) {

            if (estado_amostra == 0) {
                audio_play_sound(sfx_amostra_bunker, 2, false);
                estado_amostra = 1; // Trava e passa para a próxima fase
            }
            
            // FASE 1: Espera o 1º som terminar para tocar o 2º
            else if (estado_amostra == 1) {
                

                if (!audio_is_playing(sfx_amostra_bunker)) {
                    audio_play_sound(sfx_spawBUNKER_ou_desceramostra, 3, false);
                    scan = true;
                    
                    
                    estado_amostra = 2; // Finaliza o processo para não repetir
                }
            }
        }
    }
    
    //AMOSTRA ERRADA!
    else if (global.terra != valid_terra && global.terra != "")
	{
        
        // Toca o alarme apenas se ele já não estiver tocando
        if (!audio_is_playing(sfx_Alarm5)) {
            audio_play_sound(sfx_Alarm5, 1, false);
        }
        
    }
}

