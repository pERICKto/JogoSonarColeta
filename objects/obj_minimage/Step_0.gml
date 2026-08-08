if (keyboard_check(vk_up))    player_amplitude += 0.5;
if (keyboard_check(vk_down))  player_amplitude -= 0.5;
if (keyboard_check(vk_right)) player_frequencia += 0.0005;
if (keyboard_check(vk_left))  player_frequencia -= 0.0005;
vel = 2; 

// se quiser controlar velocidade também, usa outro par de teclas
// (ex: A/D, ou Page Up/Down) pra não conflitar com as 4 setas

fase += vel * 0.05;

// clamps pra não deixar valores absurdos ou negativos
player_amplitude = clamp(player_amplitude, 5, 100);
player_frequencia = clamp(player_frequencia, 0.01, 0.15);

var diff_amp = abs(player_amplitude - alvo_amplitude);
var diff_freq = abs(player_frequencia - alvo_frequencia);

if (diff_amp <= tolerancia && diff_freq <= 0.003)  // encaixou!
{
	if(global.room == 1)
	{
		 room_goto(rm_1_terra);
		 global.room = 0;
	}
	else if (global.room == 2)
	{
		room_goto(rm_3_air);
		global.room = 0;
	}
}