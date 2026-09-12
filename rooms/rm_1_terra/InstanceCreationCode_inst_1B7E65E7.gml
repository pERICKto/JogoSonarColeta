//skip dps do minigame pra ficar bonitinho
if (global.skip)
{
    global.skip = false; // reseta, pra próxima vez a intro rodar normal de novo
    global.intro_pronta = true;     // libera o player direto, já que a intro não vai tocar
    instance_destroy();
}