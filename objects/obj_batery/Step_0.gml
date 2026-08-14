
consumo = obj_camera.pcr
if(instance_exists(obj_CENTRAL_BUNKER)){
	batery = obj_CENTRAL_BUNKER.recarga;
}
if (instance_exists(obj_Sonar_player)) {
    batery -= consumo/20	//divite p or 100, pq o pcr geralmente eh 100
}


if (batery_estado=1){
	if(!audio_is_playing(sfx_alarm4)){
	audio_play_sound(sfx_alarm4,1,false)
	}
}
if (batery_estado=2){
	if(tocou_aviso==false)
	{
		audio_play_sound(sfx_batery_alert,1,false);
	tocou_aviso=true;
	}
}

else{	//caso a bateria volte a carregar!
tocou_aviso=false
}
if (batery_estado=3){

}
if (batery_estado=4){

}

