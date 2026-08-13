//direçao e mapeamento teclado
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

if (place_meeting(x,y +9,obj_wall)){
y -= yspd
}

if (place_meeting(x -9,y,obj_wall)){
x -= xspd
}


if (keyboard_check_pressed(vk_space)) {
	raio = true;
		instance_create_layer(x, y, "Instances", obj_Sonar_player);
			
}

if (global.valid == 1)
	{
		global.valid -= 1;
		room_goto(rm_1_terra);
	} 
	
	if (global.valid == 2 )
	{
		global.valid -= 2;
		room_goto(rm_3_air);
	}
