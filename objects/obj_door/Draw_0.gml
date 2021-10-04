/// @description Insert description here
// You can write your code in this editor
draw_self();

if (show_door_requirements) {

	draw_set_alpha(.25);
	draw_rectangle(x + 26, y + 26, x + 128, y + 68, false);
	draw_set_alpha(1);
	
	draw_set_color(c_white);
	
	var offset = 0;
	
	if (required_stars > 0) {
		draw_text_transformed(
			x + 32,
			y + 32,
			"Required Stars: " + string(required_stars),
			.25, .25, 0);
		offset += 8;
	}
	
	if (required_circles > 0) {
		draw_text_transformed(
			x + 32,
			y + 32 + offset,
			"Required Circles: " + string(required_circles),
			.25, .25, 0);
		offset += 8;
	}
		
	if (required_squares > 0) {
		draw_text_transformed(
			x + 32,
			y + 32 + offset,
			"Required Squares: " + string(required_squares),
			.25, .25, 0);
		
		offset += 8;
	}
	
	if (required_triangles > 0) {
		draw_text_transformed(
			x + 32,
			y + 32 + offset,
			"Required Triangles: " + string(required_triangles),
			.25, .25, 0);
			
		offset += 8;
	}
		
	draw_set_color(c_black);

}

if (distance_to_object(obj_player) <= 10) {
	draw_set_color(c_black);
	draw_set_alpha(.75);
	draw_rectangle(x + 10, y - 40, x + 40, y - 35, false);
	draw_set_alpha(1);
	
	draw_set_color(c_white);
	draw_set_font(fnt_main);
	draw_text_transformed(x + 12, y - 40, "Press E", .25, .25, 0);
	draw_set_color(c_black);
}

draw_set_color(c_white);
draw_set_alpha(.75);
draw_rectangle(x - 32, y - 40, x + 5, y - 35, false);
draw_set_alpha(1);
	
draw_set_color(c_red);
draw_set_font(fnt_main);
draw_text_transformed(x - 30, y - 40, "Level " + string(obj_game.level), .25, .25, 0);
draw_set_color(c_black);