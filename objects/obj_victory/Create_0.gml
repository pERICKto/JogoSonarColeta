tocou_desligando = false;
estado_tv = 0;

alvo_w = display_get_gui_width();
alvo_h = display_get_gui_height();

// começa cobrindo a tela inteira (estado "ligado")
luz_w = alvo_w;
luz_h = alvo_h;

// velocidades de encolhimento
vel_w = 40;
vel_h = 60;

tela_preta = false; // vira true quando termina de encolher