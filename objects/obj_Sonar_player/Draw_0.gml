draw_set_color(cor_sonar);

// Calcula o alpha (transparencia do ponto) baseado na porcentagem percorrida do raio
var _alpha = 1 - (radius / max_radius);
draw_set_alpha(_alpha);

// Desenha o círculo principal
draw_circle(x, y, radius, true);

//  imprime um segundo círculo de 1px de diferença para dar espessura à linha
if (radius > 1) {
    draw_circle(x, y, radius  -1, true);
		}

// reseta o alpha global para 1 no final do Draw
// Se não resetar, outros objetos do jogo podem ficar transparentes também!
draw_set_alpha(1);
draw_set_colour(c_white);
