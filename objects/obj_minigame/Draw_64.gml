var centro_y = 200;
var largura = room_width;
var passo = 2; // menor = mais suave, maior = mais leve (performance)

var y_alvo_ant = centro_y + alvo_amplitude * sin(alvo_frequencia * 0 + fase);
var y_player_ant = centro_y + player_amplitude * sin(player_frequencia * 0 + fase);

for (var i = passo; i < largura; i += passo) 
{
    var y_alvo = centro_y + alvo_amplitude * sin(alvo_frequencia * i + fase);
    var y_player = centro_y + player_amplitude * sin(player_frequencia * i + fase);
    
    draw_line_color(i - passo, y_alvo_ant, i, y_alvo, c_red, c_red);
    draw_line_color(i - passo, y_player_ant, i, y_player, c_lime, c_lime);
    
    y_alvo_ant = y_alvo;
    y_player_ant = y_player;
}