
var pad = -1; 
for (var i = 4; i < 12; i++) {
    if (gamepad_is_connected(i)) {
        pad = i;
				room_goto(rm_2_bunker);
        break;
    }
}