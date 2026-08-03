
indice_aleatorio = irandom(array_length(lista_r));
r_sorteado = lista_r[indice_aleatorio];
global.r = r_sorteado;

if (room == terra1 )
{
instance_destroy();
global.errado += 1;
room_goto(rm_minimage);
}

if (room == air3)
{
instance_destroy();
global.errado += 2;
room_goto(rm_minimage);
}