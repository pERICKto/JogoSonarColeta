//direçao  e mapeamento teclado
right_key = keyboard_check_pressed(vk_right);
left_key = keyboard_check_pressed(vk_left);
up_key = keyboard_check_pressed(vk_up);
dowm_key = keyboard_check_pressed(vk_down);

//calcular direção(positiva ou negativa)
xspd = (right_key - left_key) * spd;
yspd = (dowm_key - up_key) * spd;

//andar	
x += xspd;
y += yspd;


if (keyboard_check_pressed(vk_space)) {

    instance_create_layer(x, y, "Instances", obj_Sonar_player);
}     
