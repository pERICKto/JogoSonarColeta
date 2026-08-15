var centro_y = 200;
var largura = room_width;
var passo = 2; // menor = mais suave, maior = mais leve (performance)

var y_alvo_ant = centro_y + alvo_amplitude * sin(alvo_frequencia * 0 + alvo_fase);
var y_player_ant = centro_y + player_amplitude * sin(player_frequencia * 0 + player_fase);

for (var i = passo; i < largura; i += passo) 
{
    var y_alvo = centro_y + alvo_amplitude * sin(alvo_frequencia * i + alvo_fase);
    var y_player = centro_y + player_amplitude * sin(player_frequencia * i + player_fase);
    
    draw_line_color(i - passo, y_alvo_ant, i, y_alvo, c_red, c_red);
    draw_line_color(i - passo, y_player_ant, i, y_player, c_lime, c_lime);
    
    y_alvo_ant = y_alvo;
    y_player_ant = y_player;
}

//// inicio da hud?

draw_text(20, 60, "Amp  - player: " + string_format(player_amplitude, 1, 2) + "  alvo: " + string_format(alvo_amplitude, 1, 2));
draw_text(20, 80, "Freq - player: " + string_format(player_frequencia, 1, 4) + "  alvo: " + string_format(alvo_frequencia, 1, 4));
draw_text(20, 100, "Fase - player: " + string_format(player_fase, 1, 2) + "  alvo: " + string_format(alvo_fase, 1, 2));
draw_text(20, 120, "vel - player: " + string_format(player_velocidade, 1, 2) + "  alvo: " + string_format(alvo_velocidade, 1, 2));