// Onda alvo (gerada aleatoriamente)
alvo_amplitude = irandom_range(20, 60);
alvo_frequencia = random_range(0.02, 0.08);
alvo_velocidade = random_range(0.1, 2);

// Onda do player (começa em valores neutros)
player_amplitude = 30;
player_frequencia = 0.05;
player_velocidade = 2;


alvo_fase = 0;
player_fase = 0;
tolerancia = 1.3; // margem de erro aceitável pra "encaixar"

//intro 
intro = true;
texto_intro = scribble("[c_green]syncing with bunker...    [delay]ok\nadjusting sonar... [delay]ok\nsyncing frequency... [delay][c_red] fail[/c]\n\n[c_yellow]switching to manual... [delay]\n[blink]starting...   [delay,2000]");
typist_intro = scribble_typist();
typist_intro.in(0.5, 0);

//confirmação pos minigame
espera = false;
destino = -1;
texto_final_t = scribble("[c_green]manual sync...    [delay]ok\nEncrypted massage... [delay]\nsending... [delay] \n\ndecoding... [delay]\nsample is ...   [delay][/c][c_yellow]\n\n" + string(global.terra) + " \n[blink]press sonar to confirm...");
typist_final_t = scribble_typist();
typist_final_t.in(0.5, 0);

texto_final_a = scribble("[c_green]manual sync...    [delay]ok\nEncrypted massage... [delay]\nsending... [delay] \n\ndecoding... [delay]\nsample is ...   [delay][/c][c_yellow]\n\n" + string(global.air) + " \n[blink]press sonar to confirm...");
typist_final_a = scribble_typist();
typist_final_a.in(0.5, 0);





