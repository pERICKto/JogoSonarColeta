draw_text(32, 32, "certo " + string(global.certo));
draw_text(32, 64, "errado " + string(global.errado));

if (room == rm_1_terra || rm_2_bunker||rm_3_air|| room == rm_4_agua){
draw_sprite(spr_HUD_placeholder_duh, 0,0,3); //3 pq tela tem 603pixels pra nao ter mixel
}
//hud util tem 125 pixels
