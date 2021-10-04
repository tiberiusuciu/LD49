/// @description Insert description here
// You can write your code in this editor


draw_set_color(c_black);
draw_set_alpha(.25);
draw_ellipse(x - 12, y - 1, x + 12, y + 8, false);
draw_set_alpha(1);

draw_self();

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