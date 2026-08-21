//direçao e mapeamento teclado
right_key = keyboard_check_pressed(vk_right);
left_key = keyboard_check_pressed(vk_left);
up_key = keyboard_check_pressed(vk_up);
dowm_key = keyboard_check_pressed(vk_down);

if(place_meeting(x,y,obj_CENTRAL_BUNKER))
{
	bunker = true;
}


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


if (keyboard_check_pressed(vk_space))
{
	raio = true;
		instance_create_layer(x, y, "Instances", obj_Sonar_player);
			
}

if (place_meeting(x,y,obj_CENTRAL_BUNKER))
{
	bunker = true;
}

else if (!place_meeting(x,y,obj_CENTRAL_BUNKER))
{
	bunker = false;
}
