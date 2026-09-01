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
		global.erro = true; //pra mudar o sprite da hud
       if (global.terra == 2)
	   {
		_string = "[scale,0.7][c_green]Analisando amostra...[delay] \nAnalise completa... [delay]\nAmostra aparenta ser ...  [delay]\n[c_yellow]vidro\ncolete solo!...\n [delay,1500] "
	   }
	   else if (global.terra == 3)
	   {
	   _string = "[scale,0.7][c_green]Analisando amostra...[delay] \nAnalise completa... [delay]\nAmostra aparenta ser ...  [delay]\n[c_yellow]restos de madeira\ncolete solo!...\n [delay,1500] "
	   }
	   else if (global.terra == 4)
	   {
	   _string = "[scale,0.7][c_green]Analisando amostra...[delay] \nAnalise completa... [delay]\nAmostra aparenta ser ...  [delay]\n[c_yellow]granito\ncolete solo!...\n [delay,1500] "
	   }
	   else if (global.terra == 5)
	   {
		_string = "[scale,0.7][c_green]Analisando amostra...[delay] \nAnalise completa... [delay]\nAmostra aparenta ser ...  [delay]\n[c_yellow]calcario\ncolete solo!...\n [delay,1500] "
	   }
	   else
	   {
	   _string = "[scale,0.7][c_green]porque voce trouxe isso???\nagora o laboratorio fede\ntalvez seja melhor trocar o piloto!\n [delay,1500] "
	   }
	}
	else if (global.air != "")
	{
		
	}
	else if (global.valid > 0)
	{
		_string = "[scale,0.7][c_green]Analisando drone...[delay] \nAmostras analisadas:\n " + string(global.valid);
	}
	
    else
    {
        _string = "[scale,0.7][c_green]Analisando drone...[delay] \nAmostras faltando:\n [delay][c_yellow]3 ";
    }

    if (_string != amostra_cache)
    {
        amostra_cache = _string;
        texto_amostra = scribble(_string);
        typist_amostra.in(0.45, 0); // reinicia a digitação só quando a mensagem muda
    }

    texto_amostra.draw(552, 515, typist_amostra);
	if (typist_amostra.get_state() = 1) //reseta o erro pra hud voltar ao normal
	{
		global.erro = false;
	}
}
else if (rm_check == 2)
{
    var _string = "[scale,0.7][c_green]local atual: \n[c_yellow]bunker[/c]\n[c_green]analises:[/c]\n[c_yellow]" + string(global.valid);

    if (_string != info_cache)
    {
        info_cache = _string;
        texto_info = scribble(_string);
    }
	texto_info.draw(552, 515, typist);
}
else if (rm_check == 1)
{
    var _string = "[scale,0.7][c_green]local atual:\n[c_yellow]centro de geologia[/c]\n[c_green]objetivo: [/c][delay]\n[c_yellow]analisar possiveis amostras\nlevar para o bunker[/c]";

    if (_string != info_cache)
    {
        info_cache = _string;
        texto_info = scribble(_string);
    }

    texto_info.draw(552, 515, typist);
}
else if (rm_check == 3)
{
    var _string = "[scale,0.7][c_green]local atual:\n[c_yellow]Jardim principal[/c]\n[c_green]objetivo: [/c][delay]\n[c_yellow]encontar planta adequada\nlevar amostra para o bunker";

    if (_string != info_cache)
    {
        info_cache = _string;
        texto_info = scribble(_string);
    }
	texto_info.draw(552, 515, typist);
}