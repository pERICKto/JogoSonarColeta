target_ = obj_player;
width_ = camera_get_view_width(view_camera[0])
height_ = camera_get_view_height(view_camera[0]);
pcr = 0;
cor_sonar_raio_hud = c_green
pcr = clamp(pcr,0,100);
fallout_gui = false
consumo_bateria = pcr * 1.5
global.bateria_atual = 1000;

