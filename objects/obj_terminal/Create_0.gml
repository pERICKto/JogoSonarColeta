typist = scribble_typist();
typist.in(0.4, 0);

typist_amostra = scribble_typist();
typist_amostra.in(0.4, 0);

rm_check = 0;
analise = false;

texto_info = undefined;
info_cache = "";

texto_amostra = undefined;
amostra_cache = "";

if (!instance_exists(obj_HUD_inferior))
{
    instance_create_layer(0, 0, "Instances", obj_HUD_inferior);
}
global.erro = false; // controle da hud vermelha
