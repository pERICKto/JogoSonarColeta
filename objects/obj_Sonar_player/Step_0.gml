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
        angles_hit[i] = true;	//manda o obj ficar 100/100 visivel!
        with (_target) {image_alpha = 1;}
    }
	
var _target = instance_position(_check_x, _check_y, obj_ponto_interesse);
if (_target != noone) {
    angles_hit[i] = true;
    with (_target) { image_alpha = 0.9; }  
    cor_sonar = c_red; // Muda a variável do sonar para Vermelho
}
	
	var _target = instance_position(_check_x,_check_y, obj_ponto_interesse)	
	if (_target != noone) {
        angles_hit[i] = true;
        with (_target) {image_alpha = 0.8;}
    }
}

if (radius >= max_radius)
{
    instance_destroy();
}
