
if (batery >= 0 && batery <= 1000) {
    draw_sprite(spr_batery, 0, 10, 10);
	batery_estado = 1;
}

if (batery > 1000 && batery <= 2000) {
    draw_sprite(spr_batery, 1, 10, 10);
	batery_estado = 2;
}
if (batery > 2000 && batery <= 3000) {
    draw_sprite(spr_batery, 2, 10, 10);
	batery_estado = 3;
}

if (batery > 3000) {
    draw_sprite(spr_batery, 3, 10,10 );
	batery_estado = 4;
}

draw_text(400,64,batery)

//if (batery >= 0 && batery <= 1000) {
//    batery_estado=4;
//}

//if (batery > 1000 && batery <= 2000) {
//    batery_estado=3;
//}
//if (batery > 2000 && batery <= 3000) {
//    batery_estado=2;
//}

//if (batery > 3000) {
//    batery_estado=1;
//}

//if (instance_exists(obj_Sonar_player)) {
//    batery -= 20
//}