if (rm_check == 0)
{
    // transição ou sala não mapeada -> não desenha nada
}
else if (analise)
{
    // encostando no bunker -> tem prioridade sobre o texto geral
    var _string;
    if (global.terra == global.valid_terra)
    {
        _string = "[scale,0.7][c_green]Analisando amostra...[delay] \nAnalise completa... [delay]\nAmostra correta!";
    }
    else if (global.terra != "")
    {
        _string = "[scale,0.7][c_green]Analisando amostra...[delay] \nAnalise completa... [delay][/c]\n[c_red]ERRO... [delay][/c][c_green]\nPor gavor tente novamente...";
    }
    else
    {
        _string = "[scale,0.7][c_green]Analisando drone...[delay] \nAmostras faltando... [delay] " + string(global.amostras + 1);
    }

    if (_string != amostra_cache)
    {
        amostra_cache = _string;
        texto_amostra = scribble(_string);
        typist_amostra.in(0.5, 0); // reinicia a digitação só quando a mensagem muda
    }

    texto_amostra.draw(552, 515, typist_amostra);
}
else if (rm_check == 2)
{
    var _string = "[scale,0.7]local atual: laboratorio\nanalises:" + string(global.valid);

    if (_string != info_cache)
    {
        info_cache = _string;
        texto_info = scribble(_string);
    }

    texto_info.draw(552, 515, typist);
}