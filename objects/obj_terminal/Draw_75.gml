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
       if (global.terra == 2)
	   {
		_string = "[scale,0.7][c_green]Analisando amostra...[delay] \nAnalise completa... [delay]\nAmostra aparenta ser ...  [delay]\nvidro...\ncolete solo!..."
	   }
	   else if (global.terra == 3)
	   {
	   _string = "madeira"
	   }
	   else if (global.terra == 4)
	   {
	   _string = "granito"
	   }
	   else if (global.terra == 5)
	   {
		_string = "calcario"
	   }
	   else
	   {
	   _string = "poop"
	   }
	}
	else if (global.valid > 0)
	{
		_string = "[scale,0.7][c_green]Amostras analisadas... " + string(global.valid)
	}
	
    else
    {
        _string = "[scale,0.7][c_green]Analisando drone...[delay] \nAmostras faltando... [delay]3 ";
    }

    if (_string != amostra_cache)
    {
        amostra_cache = _string;
        texto_amostra = scribble(_string);
        typist_amostra.in(0.45, 0); // reinicia a digitação só quando a mensagem muda
    }

    texto_amostra.draw(552, 515, typist_amostra);
}
else if (rm_check == 2)
{
    var _string = "[scale,0.7][c_green]local atual: laboratorio\nanalises:" + string(global.valid);

    if (_string != info_cache)
    {
        info_cache = _string;
        texto_info = scribble(_string);
    }

    texto_info.draw(552, 515, typist);
}