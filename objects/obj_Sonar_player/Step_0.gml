// Expande a onda
radius += expand_speed;

// Checa colisões em 360 graus
var total_angles = 360 / angle_step;

for (var i = 0; i < total_angles; i++) {
    // Se este ângulo já gerou um ping, pula
    if (angles_hit[i]) continue;
    
    var _angle = i * angle_step;
    var _check_x = x + lengthdir_x(radius, _angle);
    var _check_y = y + lengthdir_y(radius, _angle);
    
    // Verifica se a borda da onda atingiu uma parede
    if (position_meeting(_check_x, _check_y, obj_wall)) {
        // Marca que esse ângulo já colidiu
        angles_hit[i] = true;
        
        // Cria um ponto de impacto na parede
        instance_create_layer(_check_x, _check_y, "Instances", obj_sonar_ping);
    }
}

// Se o pulso atingiu o raio máximo, ele se destrói
if (radius >= max_radius) {
    instance_destroy();
}

// Faz o ponto sumir gradualmente
alpha -= fade_speed;

if (alpha <= 0) {
    instance_destroy();
}