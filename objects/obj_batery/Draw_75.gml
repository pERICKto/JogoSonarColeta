
if (batery_estado = 1) {
    draw_sprite(spr_batery, 0, 100, 10);
}

if (batery_estado = 2) {
    draw_sprite(spr_batery, 1, 70, 504);
	
}
if (batery_estado = 3) {
    draw_sprite(spr_batery, 2, 100, 100);
}

if (batery_estado = 4) {
    draw_sprite(spr_batery, 3, 100, 100 );
}

draw_text(400,64,global.bateria_atual )