if (rm_check == 0)
{
    // transição ou sala não mapeada -> não desenha nada
}
else if (analise)
{
    // encostando no bunker -> tem prioridade sobre o texto geral
    var _string;
    if (global.terra == valid_terra)
    {
        _string = "amostra validada!";
    }
    else if (global.terra != "")
    {
        _string = "amostra errada, procure outra.";
    }
    else
    {
        _string = "nenhuma amostra coletada ainda.";
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
    var _string = "local atual: laboratorio\nanalises:" + string(global.valid);

    if (_string != info_cache)
    {
        info_cache = _string;
        texto_info = scribble(_string);
    }

    texto_info.draw(552, 515, typist);
}