//hardware...		operacional
//firmware...		ok 
//ram...			ok
//rom...			ok
//cpu...			ok
//gpu...			FAIL
//moving graphic to CPU
//SUCESS
//coontroller...	fail, please connect 

//posicao inicial texto

var _pos_x = 67;
var _pos_y = 67;
var _espaco_y = 25; 


for (var _i = 0; _i < linha_atual; _i++) {
    var _pacote = linhas[_i];
    var _y_desta_linha = _pos_y + (_i * _espaco_y);
    
    // desenha a parte 1 (branca)
    draw_set_color(_pacote.c1);
    draw_text(_pos_x, _y_desta_linha, _pacote.t1);
    
    // mede a parte 1 e desenha a parte 2 (colorida) logo na frente dela
    var _largura_t1 = string_width(_pacote.t1);
    draw_set_color(_pacote.c2);
    draw_text(_pos_x + _largura_t1, _y_desta_linha, _pacote.t2);
}

//efeito maquina de escrever
if (linha_atual < array_length(linhas)) {
    var _pacote = linhas[linha_atual];
    var _y_desta_linha = _pos_y + (linha_atual * _espaco_y);
    
    var _tam_t1 = string_length(_pacote.t1);
    
    // CASO A: A tesoura ainda está cortando a primeira parte (o texto branco)
    if (caracter_atual <= _tam_t1) {
        draw_set_color(_pacote.c1);
        var _corte = string_copy(_pacote.t1, 1, floor(caracter_atual));
        draw_text(_pos_x, _y_desta_linha, _corte);
    }
    // CASO B: A tesoura já terminou a parte 1 e está cortando o status final (colorido)
    else {
        draw_set_color(_pacote.c1);
        draw_text(_pos_x, _y_desta_linha, _pacote.t1);

        var _largura_t1 = string_width(_pacote.t1);

        var _letras_restantes = caracter_atual - _tam_t1; 
        
        draw_set_color(_pacote.c2);
        var _corte2 = string_copy(_pacote.t2, 1, floor(_letras_restantes));
        draw_text(_pos_x + _largura_t1, _y_desta_linha, _corte2);
    }
}

draw_set_color(c_white); //reseta cor