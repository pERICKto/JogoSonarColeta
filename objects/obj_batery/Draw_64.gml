
if (batery >= 0 && batery <= 1000) {
    draw_sprite(spr_batery, 0, 10, 10);
}

if (batery > 1000 && batery <= 2000) {
    draw_sprite(spr_batery, 1, 10, 10);
}
if (batery > 2000 && batery <= 3000) {
    draw_sprite(spr_batery, 2, 10, 10);
}

if (batery > 3000) {
    draw_sprite(spr_batery, 3, 10, 10);
}

if (instance_exists(obj_Sonar_player)) {
    batery -= 50
}

draw_text(400,64,batery)