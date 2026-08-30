if (intro)
{
    if (typist_intro.get_state() == 1.0)
    {
        intro = false;
    }
}
else
{
    if (!espera)
    {
        if (keyboard_check(vk_up))    player_amplitude += 0.4;
        if (keyboard_check(vk_down))  player_amplitude -= 0.4;
        if (keyboard_check(vk_right)) player_frequencia += 0.0004;
        if (keyboard_check(vk_left))  player_frequencia -= 0.0004;
        if (keyboard_check(ord("W"))) player_velocidade += 0.05;
        if (keyboard_check(ord("S"))) player_velocidade -= 0.05;

        player_fase += player_velocidade * 0.05;  
        alvo_fase += alvo_velocidade * 0.05;

        player_amplitude = clamp(player_amplitude, 0, 80);
        player_frequencia = clamp(player_frequencia, 0.01, 0.10);
        player_velocidade = clamp(player_velocidade, 0, 5);

        var diff_amp = abs(player_amplitude - alvo_amplitude);
        var diff_freq = abs(player_frequencia - alvo_frequencia);
        var diff_vel  = abs(player_velocidade - alvo_velocidade);
        var diff_fase = abs(player_fase - alvo_fase);
        diff_fase = diff_fase mod (2 * pi);
        if (diff_fase > pi) diff_fase = (2 * pi) - diff_fase;

        if (diff_amp <= tolerancia && diff_freq <= 0.007 && diff_fase <= 0.5 && diff_vel <= 0.4)
        {
            if (global.binary == 1)
            {
                espera = true;
                destino = rm_1_terra;
                global.binary -= 1;
            }
            else if (global.binary == 2)
            {
                espera = true;
                destino = rm_3_air;
                global.binary -= 2;
            }
        }
    }
    else
    {
        // CONFIRMAR (Pegar a amostra - Botão de Espaço/Sonar)
        if (keyboard_check_pressed(vk_space))
        { 
            room_goto(destino);
        }
        
        // RECUSAR (Descartar a amostra - Qualquer Direcional)
        else if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right) || keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_down))
        {
            // Limpa a amostra da mão do jogador e NÃO adiciona no global.usado
            if (destino == rm_1_terra) {
                global.terra = "";
            } 
            else if (destino == rm_3_air) {
                global.air = "";
            }
            
            room_goto(destino);
        }
    }
}