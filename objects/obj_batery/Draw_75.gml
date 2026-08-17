
if (batery_estado = 1) {
    draw_sprite(spr_batery, 0, 71, 514);
}

if (batery_estado = 2) {
    draw_sprite(spr_batery, 1, 71, 514);
	
}
if (batery_estado = 3) {
    draw_sprite(spr_batery, 2, 71, 514);
}

if (batery_estado = 4) {
    draw_sprite(spr_batery, 3, 71, 514);
}

draw_text(400,64,global.bateria_atual )