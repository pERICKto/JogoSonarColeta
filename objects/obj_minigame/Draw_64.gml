if (intro)
{
    texto_intro.draw(100, 100, typist_intro);
}
else
{
    if (!espera)
    {
        var centro_y = 150;
        var largura = room_width;
        var passo = 2;
        var y_alvo_ant = centro_y + alvo_amplitude * sin(alvo_frequencia * 0 + alvo_fase);
        var y_player_ant = centro_y + player_amplitude * sin(player_frequencia * 0 + player_fase);
        for (var i = passo; i < largura; i += passo) 
        {
            var y_alvo = centro_y + alvo_amplitude * sin(alvo_frequencia * i + alvo_fase);
            var y_player = centro_y + player_amplitude * sin(player_frequencia * i + player_fase);
            
            draw_line_color(i - passo, y_alvo_ant, i, y_alvo, c_red, c_red);
            draw_line_color(i - passo, y_player_ant, i, y_player, c_lime, c_lime);
            
            y_alvo_ant = y_alvo;
            y_player_ant = y_player;
        }

        draw_text(20, 60, "Amp  - player: " + string_format(player_amplitude, 1, 2) + "  alvo: " + string_format(alvo_amplitude, 1, 2));
        draw_text(20, 80, "Freq - player: " + string_format(player_frequencia, 1, 4) + "  alvo: " + string_format(alvo_frequencia, 1, 4));
        draw_text(20, 100, "Fase - player: " + string_format(player_fase, 1, 2) + "  alvo: " + string_format(alvo_fase, 1, 2));
        draw_text(20, 120, "vel - player: " + string_format(player_velocidade, 1, 2) + "  alvo: " + string_format(alvo_velocidade, 1, 2));
    }
    else
    {
		var _string;
        if (destino == rm_1_terra)
        {
			if (typist_final_t.get_state() < 1)
			{
			texto_final_t.draw(100,80,typist_final_t);
			}
		
		else	
		{
			if (global.terra == 1)
			{
				_string = "[c_green]01000011 01000001 : 00110110 00110000 %\n01001101 01000111 : 00110001 00110101 %\n01001011 : 00110000 00110101 %\n01001000 : 00110001 00110010 %\n01000001 01001100 : 00110000 00111000 %\nAnalise finalizada... [delay]\n\n[c_yellow][blink]sonar = coletar \n\noutro = largar"
			}
			else if (global.terra == 2)
			{
				_string = "[c_green]vidro"
			}
			else if (global.terra == 3)
			{
				_string = "[c_green]madeira"
			}
			else if (global.terra == 4)
			{
				_string = "[c_green]granito"
			}
			else if (global.terra == 5)
			{
				_string = "[c_green]calcario"
			}
			else
			{
				_string = "[c_green]poop"
			}
			 if (_string != binario_cache)
			{
			binario_cache = _string;
	        texto_binario = scribble(_string);
	        typist_binario.in(0.45, 0); // reinicia a digitação só quando a mensagem muda
			}

			texto_binario.draw(100, 80, typist_binario);
		  }
        
		}
        else if (destino == rm_3_air)
        {
            texto_final_a.draw(100,80,typist_final_a);
        }
    }
}