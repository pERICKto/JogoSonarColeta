radius += expand_speed;

var total_angles = 360 / angle_step;

for (var i = 0; i < total_angles; i++) {
    if (angles_hit[i]) continue;
    
    var _angle = i * angle_step;
    var _check_x = x + lengthdir_x(radius, _angle);
    var _check_y = y + lengthdir_y(radius, _angle);
    
    // Procura por blocos escaneáveis
    var _target = instance_position(_check_x, _check_y, obj_wall);
    
    if (_target != noone) {
        angles_hit[i] = true;
        
        // manda o bloco atingido ficar 100% visível!
        with (_target) {
            image_alpha = 1;

        }
    }
  var _target = instance_position(_check_x, _check_y, obj_ponto_interesse_errado);
    
    if (_target != noone) {
        angles_hit[i] = true;
        
        // manda o bloco atingido ficar 100% visível!
        with (_target) {
            image_alpha = 1;

        }
    }
}



if (radius >= max_radius) {
    instance_destroy();
}