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
	else if (global.air == global.valid_air)
	{
		 _string = "[scale,0.7][c_green]Analisando amostra...[delay] \nAnalise completa... [delay]\nAmostra correta!";
	}
    else if (global.terra != "")
    {
       if (global.terra == 2)
	   {
		_string = "[scale,0.7][c_green]Analisando amostra...[delay] \nAnalise completa... [delay]\nAmostra aparenta ser ...  [delay]\n[c_yellow]vidro...[/c]\ncolete solo!..."
	   }
	   else if (global.terra == 3)
	   {
	   _string = "[scale,0.7][c_green]Analisando amostra...[delay] \nAnalise completa... [delay]\nAmostra aparenta ser ...  [delay]\n[c_yellow]madeira...[/c]\ncolete solo!..."
	   }
	   else if (global.terra == 4)
	   {
	   _string = "[scale,0.7][c_green]Analisando amostra...[delay] \nAnalise completa... [delay]\nAmostra aparenta ser ...  [delay]\n[c_yellow]granito...[/c]\ncolete solo!..."
	   }
	   else if (global.terra == 5)
	   {
		_string = "[scale,0.7][c_green]Analisando amostra...[delay] \nAnalise completa... [delay]\nAmostra aparenta ser ...  [delay]\n[c_yellow]calcario...[/c]\ncolete solo!..."
	   }
	   else
	   {
	   _string = "[scale,0.7][c_green]porque voce trouxe isso???\nagora o laboratorio fede\ntalvez seja melhor outra pessoa fazer isso!"
	   }
	}
	else if (global.air != "")
	{
		
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
    var _string = "[scale,0.7][c_green]local atual: \nlaboratorio\nanalises:\n" + string(global.valid);

    if (_string != info_cache)
    {
        info_cache = _string;
        texto_info = scribble(_string);
    }
	texto_info.draw(552, 515, typist);
}
else if (rm_check == 1)
{
    var _string = "[scale,0.7][c_green]local atual:\ncentro de geologia...\nobjetivo: [delay]\nanalisar pontos de interesse...\nlevar solo para o [c_yellow]lab";

    if (_string != info_cache)
    {
        info_cache = _string;
        texto_info = scribble(_string);
    }

    texto_info.draw(552, 515, typist);
}
else if (rm_check == 3)
{
    var _string = "[scale,0.7][c_green]local atual:Jardim principal...\nobjetivo: [delay]\nencontar planta adequada...\nlevar amostra para o [c_yellow]lab";

    if (_string != info_cache)
    {
        info_cache = _string;
        texto_info = scribble(_string);
    }
	texto_info.draw(552, 515, typist);
}