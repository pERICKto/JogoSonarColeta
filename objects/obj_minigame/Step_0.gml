if (!espera)
{
	
if (keyboard_check(vk_up))    player_amplitude += 0.4;
if (keyboard_check(vk_down))  player_amplitude -= 0.4;
if (keyboard_check(vk_right)) player_frequencia += 0.0004;
if (keyboard_check(vk_left))  player_frequencia -= 0.0004;
if (keyboard_check(ord("W"))) player_velocidade += 0.05;
if (keyboard_check(ord("S"))) player_velocidade -= 0.05;

//fase para calcular o draw
player_fase += player_velocidade * 0.05;  
alvo_fase += alvo_velocidade * 0.05;



// clamps pra não deixar valores absurdos ou negativos
player_amplitude = clamp(player_amplitude, 5, 100);
player_frequencia = clamp(player_frequencia, 0.01, 0.15);
player_velocidade = clamp(player_velocidade, -10, 10);

var diff_amp = abs(player_amplitude - alvo_amplitude);
var diff_freq = abs(player_frequencia - alvo_frequencia);
var diff_vel  = abs(player_velocidade - alvo_velocidade);
var diff_fase = abs(player_fase - alvo_fase);
diff_fase = diff_fase mod (2 * pi);
if (diff_fase > pi) diff_fase = (2 * pi) - diff_fase;

if (diff_amp <= tolerancia && diff_freq <= 0.009 && diff_fase <= 0.6 && diff_vel <= 0.3)
{
	if (global.valid == 1)
	{
		espera = true;
		destino = rm_1_terra;
		global.valid -= 1;
	}
	
	else if (global.valid == 2)
{
		espera = true;
		destino = rm_3_air;
		global.valid -= 2;
}

}
}

else // so roda quando espera = true, ai trava tudo ali de cima
{
	if (keyboard_check(vk_space))
	{
		room_goto(destino);
	}
}