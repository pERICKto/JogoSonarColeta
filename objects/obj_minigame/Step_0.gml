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
var diff_fase = abs(player_fase - alvo_fase);

if (diff_amp <= tolerancia && diff_freq <= 0.003 && diff_fase <= 0.25)
{
	if (global.valid == 1)
{
		global.valid -= 1;
		room_goto(rm_1_terra);
} 
	
	else if (global.valid == 2)
{
		global.valid -= 2;
		room_goto(rm_3_air);
}

}