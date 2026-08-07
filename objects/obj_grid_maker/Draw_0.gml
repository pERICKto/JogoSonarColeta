	var w = 1; //espessura da grid
	draw_set_colour(c_orange);	//cor da grid
	draw_set_alpha(0.2)

	for (var i = 0; i <room_height; i +=60){
	draw_line_width(0,i,room_width,i,w);
	}
	for (var i = 0; i <room_width; i +=60){
	draw_line_width(i,0,i,room_height,w);
	}
	draw_set_alpha(1);
	
	draw_set_alpha(0.5);	//circulo boladao da hud redonda
	draw_set_colour(c_green);
	draw_set_circle_precision(60);	
	draw_circle(obj_player.x,obj_player.y,230,true);

	draw_set_alpha(1)
	draw_set_circle_precision(20);
	
	