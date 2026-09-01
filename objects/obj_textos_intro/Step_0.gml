if (keyboard_lastkey != -1)
{
    if (keyboard_lastkey == sequencia[indice_atual])
    {
        indice_atual++;

        if (indice_atual >= array_length(sequencia))
        {
            // sequência completa!
            room_goto(rm_2_bunker);
        }
    }
    else
    {
        // errou -> volta pro início
        // (mas se a tecla errada por acaso já é a primeira certa, já conta como o passo 1)
        indice_atual = (keyboard_lastkey == sequencia[0]) ? 1 : 0;
    }

    keyboard_lastkey = -1; // "consome" a tecla, pra não processar de novo no próximo frame
}
