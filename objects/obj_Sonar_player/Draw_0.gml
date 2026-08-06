draw_set_color(cor_sonar);

// Calcula o alpha (transparencia do ponto) baseado na porcentagem percorrida do raio
var _alpha = 1 - (radius / max_radius);
draw_set_alpha(_alpha);

// Desenha o círculo principal
draw_circle(x, y, radius, true);

//  imprime um segundo círculo de 1px de diferença para dar espessura à linha


draw_set_alpha(1);
draw_set_colour(c_white);
