/// @description Insert description here
// You can write your code in this editor
draw_self();

if (show_door_requirements) {

	draw_set_alpha(.25);
	draw_rectangle(x + 26, y + 26, x + 128, y + 68, false);
	draw_set_alpha(1);
	
	draw_set_color(c_white);

	draw_text_transformed(
		x + 32,
		y + 32,
		"Required Stars: " + string(required_stars),
		.25, .25, 0);
		
	draw_text_transformed(
		x + 32,
		y + 40,
		"Required Circles: " + string(required_circles),
		.25, .25, 0);
		
	draw_text_transformed(
		x + 32,
		y + 48,
		"Required Squares: " + string(required_squares),
		.25, .25, 0);
		
	draw_text_transformed(
		x + 32,
		y + 56,
		"Required Triangles: " + string(required_triangles),
		.25, .25, 0);
		
	draw_set_color(c_black);

}