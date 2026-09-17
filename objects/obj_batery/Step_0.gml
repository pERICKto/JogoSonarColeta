
consumo = obj_camera.pcr
if(instance_exists(obj_CENTRAL_BUNKER)){
	global.bateria_atual  = obj_CENTRAL_BUNKER.recarga;
}
if (instance_exists(obj_Sonar_player)) {
    global.bateria_atual  -= consumo/50	//divite p or 100, pq o pcr geralmente eh 100
}

if (global.bateria_atual >= 0 && global.bateria_atual <= 99)
{ batery_estado = 5; }

if (global.bateria_atual  >= 100 && global.bateria_atual  <= 499) {
		batery_estado = 1
			if(!audio_is_playing(sfx_alarm4)){
	audio_play_sound(sfx_alarm4,1,false)
	}
}

if (global.bateria_atual  >= 500 && global.bateria_atual  <= 1999) { 
		batery_estado = 2;
			if(tocou_aviso==false)
	{
		audio_play_sound(sfx_batery_alert,1,false);		//BAAAAAAHN 
	tocou_aviso=true;
	}
}

else{	//caso a bateria volte a carregar!
}

if (global.bateria_atual  >= 2000 && global.bateria_atual  <= 2999) {
		batery_estado = 3;
}

if (global.bateria_atual  > 3000) {
		batery_estado = 4;
}

