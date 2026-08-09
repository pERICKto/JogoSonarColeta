if (intro_terminou) exit;

// Atualiza a posição do feixe
scan_x += scan_speed;

if (scan_x >= gui_w) {
    scan_x = 0;
    scan_y += line_height;
}
if (scan_y >= gui_h) {
    intro_terminou = true;
    if (surface_exists(surf_intro)) surface_free(surf_intro);
    exit;
}
// cria camada (bm_subtract)
if (!surface_exists(surf_intro)) {
    surf_intro = surface_create(gui_w, gui_h);
}
// pinta camada de preto
surface_set_target(surf_intro);
draw_clear(c_black);

gpu_set_blendmode(bm_subtract);

if (scan_y > 0) {
    draw_rectangle(0, 0, gui_w, scan_y, false);
}
draw_rectangle(0, scan_y, scan_x, scan_y + line_height, false);

gpu_set_blendmode(bm_normal);
surface_reset_target();

draw_surface(surf_intro, 0, 0);

if (surface_exists(application_surface)) {
    // Entra no modo aditivo (Soma a luz da imagem do jogo sobre ela mesma)
    gpu_set_blendmode(bm_add);

    var _glow_w = 30; // Largura do feixe no momento do impacto
    var _src_x = max(0, scan_x - _glow_w);
    var _draw_w = scan_x - _src_x;

    if (_draw_w > 0) {
        // PASSO A: Flash de Impacto
        // Recorta a fatia exata da tela do jogo e desenha por cima para "estourar" a luz do pixel
        draw_surface_part_ext(
            application_surface, 
            _src_x, scan_y,           // Coordenada onde o pixel do jogo está
            _draw_w, line_height,     // Tamanho da fatia sendo varrida
            _src_x, scan_y,           // Posição de desenho
            1, 1,                     // Escala
            c_white, 1.0              // Preserva 100% a cor original do pixel
        );
        // PASSO B: Rastro de Fósforo (Estica a luz do pixel pra trás no eixo X e Y)        // Isso simula o fósforo do vidro "queimando" quente e esfriando devagar
        draw_surface_part_ext(
            application_surface,
            _src_x, scan_y,
            _draw_w, line_height,
            _src_x - 50, scan_y - 2,  // Puxa o rastro para a esquerda e levemente para cima
            4.0, 1.5,                 // Expande/desfoca a luz do próprio pixel
            c_white, 0.6              // Alpha suave para o rastro
        );
    }
    // Reseta o Blendmode para não quebrar o resto da tela
    gpu_set_blendmode(bm_normal);
}