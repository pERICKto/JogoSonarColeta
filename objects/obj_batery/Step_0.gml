
consumo = obj_camera.pcr
if(instance_exists(obj_CENTRAL_BUNKER)){
	batery = obj_CENTRAL_BUNKER.recarga;
}
if (instance_exists(obj_Sonar_player)) {
    batery -= consumo/20	//divite p or 100, pq o pcr geralmente eh 100
}
