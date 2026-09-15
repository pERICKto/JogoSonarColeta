if (bolinhadegorfe == true){
var pad = -1; 
for (var i = 4; i < 12; i++) {
    if (gamepad_is_connected(i)) {
        pad = i;
			audio_play_sound(distorted_welcome_jingle,1,false);
				room_goto(rm_2_bunker);
        break;
    }
}}