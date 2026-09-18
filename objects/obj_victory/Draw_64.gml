var _centro_x = display_get_gui_width() / 2;
var _centro_y = display_get_gui_height() / 2;

draw_set_color(c_black);

if (tela_preta) {
    draw_set_alpha(1); // preto sólido, sem transparência, no final
} else {
    draw_set_alpha(0.8);
}
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

if (!tela_preta)
{
    var _x1 = _centro_x - (luz_w / 2);
    var _y1 = _centro_y - (luz_h / 2);
    var _x2 = _centro_x + (luz_w / 2);
    var _y2 = _centro_y + (luz_h / 2);

    draw_set_color(c_white);
    draw_rectangle(_x1, _y1, _x2, _y2, false);
}

draw_set_alpha(1);
draw_set_color(c_white);