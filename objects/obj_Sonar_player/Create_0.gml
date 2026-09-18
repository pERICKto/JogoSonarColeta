// Raio inicial e configurações do pulso
cor_sonar = c_green;
convert_radius = obj_camera.pcr; //traz a variavel pcr da camera 
radius = 0;
max_radius = convert_radius * 5;  //diminui o raio do sonar de acordo com o pcr
expand_speed = 5;      
wave_width = 8;         // Espessura do anel
alpha = 1.0;
fade_speed = 0.02; // Velocidade com que o ponto desaparece

// pega tudo que existe dentro do alcance máximo, uma vez só
lista_paredes = ds_list_create();
lista_pontos = ds_list_create();
collision_circle_list(x, y, max_radius, obj_wall, false, true, lista_paredes, false);
collision_circle_list(x, y, max_radius, obj_ponto, false, true, lista_pontos, false);

n_paredes = ds_list_size(lista_paredes);
dist_paredes = array_create(n_paredes);
for (var i = 0; i < n_paredes; i++) {
    dist_paredes[i] = point_distance(x, y, lista_paredes[| i].x, lista_paredes[| i].y);
}

n_pontos = ds_list_size(lista_pontos);
dist_pontos = array_create(n_pontos);
pontos_visiveis = array_create(n_pontos); // se tem parede no caminho ou não
for (var i = 0; i < n_pontos; i++) {
    var _p = lista_pontos[| i];
    dist_pontos[i] = point_distance(x, y, _p.x, _p.y);

    // testa a linha reta entre o sonar e o ponto: bateu em obj_wall no meio do caminho?
    var _bloqueado = collision_line(x, y, _p.x, _p.y, obj_wall, false, true);
    pontos_visiveis[i] = (_bloqueado == noone);
}