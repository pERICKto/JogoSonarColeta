// Onda alvo (gerada aleatoriamente)
alvo_amplitude = irandom_range(20, 60);
alvo_frequencia = random_range(0.02, 0.08);
alvo_velocidade = random_range(1, 3);

// Onda do player (começa em valores neutros)
player_amplitude = 30;
player_frequencia = 0.05;
player_velocidade = 2;

fase = 0;
tolerancia = 2; // margem de erro aceitável pra "encaixar"