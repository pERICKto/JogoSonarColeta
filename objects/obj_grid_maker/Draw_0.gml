	var w = 2; //espessura da grid
	draw_set_colour(c_green);	//cor da grid
	draw_set_alpha(0.2)
	
	for (var i = 0; i <room_height; i +=60){
	draw_line_width(0,i,room_width,i,w);
	}
	
	for (var i = 0; i <room_width; i +=60){
	draw_line_width(i,0,i,room_height,w);
	}
	