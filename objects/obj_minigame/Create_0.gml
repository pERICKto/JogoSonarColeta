// Onda alvo (gerada aleatoriamente)
alvo_amplitude = irandom_range(10, 70);
alvo_frequencia = random_range(0.02, 0.08);
alvo_velocidade = random_range(0.5, 4);

// Onda do player (começa em valores neutros)
player_amplitude = 30;
player_frequencia = 0.05;
player_velocidade = 0;


alvo_fase = 0;
player_fase = 0;
tolerancia = 1.45; // margem de erro aceitável pra "encaixar"

//intro 
intro = true;
texto_intro = scribble("[c_green]syncing with bunker...    [delay]ok\nadjusting sonar...    [delay]ok\nsyncing frequency...    [delay][c_red]fail[/c]\n\n[c_yellow]switching to manual... [delay]\n[blink]starting...   [delay,1500]");
typist_intro = scribble_typist();
typist_intro.in(0.5, 0);

//confirmação pos minigame
espera = false;
destino = -1;

texto_final_t = scribble("[c_green]manual sync...    [delay]ok\n\ndecoding... [delay][delay]\n\nsending... [delay]");
typist_final_t = scribble_typist();
typist_final_t.in(0.5, 0);

texto_final_a = scribble("[c_green]manual sync...    [delay]ok\n\ndecoding... [delay][delay]\n\nsending... [delay]");
typist_final_a = scribble_typist();
typist_final_a.in(0.5, 0);

//msg dos binario
typist_binario = scribble_typist();
texto_binario = undefined;
binario_cache = "";




