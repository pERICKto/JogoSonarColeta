if (room == rm_minigame) {
    visible = false;
    instance_deactivate_object(obj_Sonar_player); // desliga Step e colisões também
} else {
    visible = true;
    instance_activate_object(obj_Sonar_player);
}