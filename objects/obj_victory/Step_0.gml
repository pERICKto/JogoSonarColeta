if (tocou_desligando == false)
{
    audio_play_sound(zap_power_down, 1, false);
    tocou_desligando = true;
}

switch (estado_tv) {
    case 0:
        estado_tv = 1;
    break;

    case 1: // encolhendo verticalmente (a tela vira uma linha)
        luz_h -= vel_h;

        if (luz_h <= 2) {
            luz_h = 2;
            estado_tv = 2;
        }
    break;

    case 2: // encolhendo horizontalmente (a linha vira um ponto e some)
        luz_w -= vel_w;

        if (luz_w <= 2) {
            luz_w = 2;
            tela_preta = true; // terminou -> fica preto
        }
    break;
}