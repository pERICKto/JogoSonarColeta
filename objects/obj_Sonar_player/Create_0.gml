// Raio inicial e configurações do pulso
radius = 0;
max_radius = 400;      
expand_speed = 6;      
wave_width = 8;         // Espessura do anel
angle_step = 4;         // Precisão da checagem (a cada 4 graus = 90 raios no total)

angles_hit = array_create(360 / angle_step, false);		// Lista para registrar quais angulos já colidiram nesta onda


alpha = 1.0;
fade_speed = 0.02; // Velocidade com que o ponto desaparece