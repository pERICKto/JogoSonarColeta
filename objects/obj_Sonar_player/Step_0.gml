radius += expand_speed;

// PAREDES
for (var i = 0; i < n_paredes; i++) {
    if (dist_paredes[i] <= radius) {
        var _inst = lista_paredes[| i];
        
        // CORREÇÃO: Confia apenas no "fading" para não prender o brilho em 1.0
        if (instance_exists(_inst) && !_inst.fading) {
            _inst.image_alpha = 1;
            _inst.fading = true;
            ds_list_add(obj_camera.lista_fade, _inst); // Manda para a câmera
        }
    }
}

// PONTOS
for (var i = 0; i < n_pontos; i++) {
    if (dist_pontos[i] <= radius && pontos_visiveis[i]) {
        var _inst = lista_pontos[| i];
        
        // CORREÇÃO: Faz os pontos irem para a mesma lista de apagamento
        if (instance_exists(_inst) && !_inst.fading) {
            _inst.image_alpha = 0.9;
            _inst.fading = true;
            cor_sonar = c_yellow; 
            ds_list_add(obj_camera.lista_fade, _inst); // Manda para a câmera
        }
    }
}
var _tamanho = ds_list_size(lista_fade);

for (var i = _tamanho - 1; i >= 0; i--) {
    var _inst = lista_fade[| i];

    if (instance_exists(_inst)) {
        _inst.image_alpha -= fade_speed; // Vai abaixando o alpha imediatamente
        
        if (_inst.image_alpha <= 0) {
            _inst.image_alpha = 0;
            _inst.fading = false;
            ds_list_delete(lista_fade, i);
        }
    } 
    else {
        ds_list_delete(lista_fade, i);
    }
}
// Destrói imediatamente, sem estragar as outras partes do seu código
if (radius >= max_radius) {
    instance_destroy();
}