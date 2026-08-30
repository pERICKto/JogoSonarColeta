radius += expand_speed;

for (var i = 0; i < n_paredes; i++) {
    if (dist_paredes[i] <= radius) {
        var _inst = lista_paredes[| i];
        if (instance_exists(_inst) && _inst.image_alpha != 1) {
            _inst.image_alpha = 1; //manda o obj ficar 100/100 visivel!
        }
    }
}

for (var i = 0; i < n_pontos; i++) {
    // só revela se: já entrou no raio E não tem parede bloqueando a visão
    if (dist_pontos[i] <= radius && pontos_visiveis[i]) {
        var _inst = lista_pontos[| i];
        if (instance_exists(_inst) && _inst.image_alpha != 0.9) {
            _inst.image_alpha = 0.9;
            cor_sonar = c_yellow; // Muda pa amarelo
        }
    }
}

if (radius >= max_radius)
{
    instance_destroy();
}