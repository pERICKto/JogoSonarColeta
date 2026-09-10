var pad = -1;
for (var i = 4; i < 12; i++) {
    if (gamepad_is_connected(i)) {
        pad = i;
        break;
    }
}

// DIREÇÃO E MAPEAMENTO (TECLADO + ARDUINO)
// Mapeamento dos índices do Arduino: 
right_key = keyboard_check_pressed(vk_right) || (pad != -1 && gamepad_button_check_pressed(pad, 3));
left_key  = keyboard_check_pressed(vk_left)  || (pad != -1 && gamepad_button_check_pressed(pad, 1));

var up_check   = keyboard_check(vk_up)   || (pad != -1 && gamepad_button_check(pad, 0));
var down_check = keyboard_check(vk_down) || (pad != -1 && gamepad_button_check(pad, 2));

// girar o sprite 90 graus a cada aperto
if (right_key)
{
    image_angle -= 90; // gira pra direita
}
if (left_key)
{
    image_angle += 90; // gira pra esquerda (volta)
}

mov = (up_check - down_check);
xspd = lengthdir_x(spd, image_angle) * mov;
yspd = lengthdir_y(spd, image_angle) * mov;

// andar
x += xspd;
y += yspd;

if (place_meeting(x, y + 9, obj_wall))
{
    y -= yspd;
}
if (place_meeting(x - 9, y, obj_wall))
{
    x -= xspd;
}

// ATIVAÇÃO DO SONAR (Espaço OU Botão Sonar)
var sonar_key = keyboard_check_pressed(vk_space) || (pad != -1 && gamepad_button_check_pressed(pad, 4));

if (sonar_key)
{
    raio = true;
    instance_create_layer(x, y, "Instances", obj_Sonar_player);
}

if (place_meeting(x, y, obj_CENTRAL_BUNKER))
{
    bunker = true;
}
else
{
    bunker = false;
}