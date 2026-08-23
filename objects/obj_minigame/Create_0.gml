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

//confirmação pos minigame
espera = false;
destino = -1;

//intro 
intro = true;
texto_intro = scribble("iniciando sincronização com o bunker...    [delay]\ncalibrando antena... [delay]\nsincronizando frequência... [delay][c_red] fail\n\niniciando sincronia manual... [dalay] iniciado");
typist_intro = scribble_typist();
typist_intro.in(0.5, 0);