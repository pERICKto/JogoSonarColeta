typist = scribble_typist();
typist.in(0.3, 0);
typist.sound_per_char(sfx_hud1, 0.7, 1.3, " ", 0.8, true);

//comandos pra iniciar jogo 
sequencia = [vk_up, vk_up, vk_down, vk_down, vk_left, vk_right, vk_left, vk_right, vk_space];
indice_atual = 0;