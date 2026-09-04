//direção e mapeamento teclado
right_key = keyboard_check_pressed(vk_right);
left_key = keyboard_check_pressed(vk_left);
up_key = keyboard_check_pressed(vk_up);
dowm_key = keyboard_check_pressed(vk_down);

if (!global.lendo)
{
    //girar o sprite 90 graus a cada aperto
    if (right_key)
    {
        image_angle -= 90; // gira pra direita
    }
    if (left_key)
    {
        image_angle += 90; // gira pra esquerda (volta)
    }

    //andar pra frente/trás na direção que o sprite tá olhando
    mov = (keyboard_check(vk_up) - keyboard_check(vk_down));
    xspd = lengthdir_x(spd, image_angle) * mov;
    yspd = lengthdir_y(spd, image_angle) * mov;

    //andar
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

    if (keyboard_check_pressed(vk_space))
    {
        raio = true;
        instance_create_layer(x, y, "Instances", obj_Sonar_player);
    }
}


if (place_meeting(x, y, obj_CENTRAL_BUNKER))
{
    bunker = true;
}
else
{
    bunker = false;
}