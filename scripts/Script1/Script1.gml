function Script1(){
	var w = 2; //espessura da grid
	draw_set_colour(c_green);	//cor da grid
	
	for (var i = 0; i <room_height; i +=60){
	draw_line_width(0,i,room_width,i,w);
	}
	
	for (var i = 0; i <room_width; i +=60){
	draw_line_width(i,0,i,room_height,w);
	}
	draw_line



}


////function Script1(){
//	var w = 2; //espessura da grid
//	draw_set_colour(c_green);	//cor da grid
	
//	for (var i = 0; i <room_height; i +=30){
//	draw_line_width(0,i,room_width,i,w);
//	}
	
//	for (var i = 0; i <room_width; i +=30){
//	draw_line_width(i,0,room_height,i,w);
//	}
//	efeito maneiro, testar mais tarde para algo da hud!