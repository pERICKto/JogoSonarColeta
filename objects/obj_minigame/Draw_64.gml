var centro_y = 200;
var largura = room_width;

for (var i = 0; i < largura; i++) 
{
    var y_alvo   = centro_y + alvo_amplitude   * sin(alvo_frequencia   * x + fase);
    var y_player = centro_y + player_amplitude * sin(player_frequencia * x + fase);
    
    draw_point_color(x, y_alvo, c_red);
    draw_point_color(x, y_player, c_lime);
}