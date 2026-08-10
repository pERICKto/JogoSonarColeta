if (linha_atual < array_length(linhas)) {
    
    var _pacote = linhas[linha_atual];
    
    // Junta as duas partes para saber o tamanho total da frase
    var _texto_completo = _pacote.t1 + _pacote.t2;
    var _tamanho_total = string_length(_texto_completo);

    if (caracter_atual < _tamanho_total) {
        
        // descobre o caracter que esta sendo impresso agora
        // string em game maker conta do 1!
        var _letra_agora = string_char_at(_texto_completo, floor(caracter_atual) + 1);
        
        var _vel = 0.3; // Velocidade padrão de digitação
        
        // spd ponto final
        if (_letra_agora == ".") {
            _vel = 0.1; 
        } 
        // digita rapido espacos vazios grandes
		
        else if (_letra_agora == " ") {
            _vel = 1.0;
        }

        caracter_atual += _vel;
    } 
    else {
        linha_atual++;       
        caracter_atual = 0;  
    }
}