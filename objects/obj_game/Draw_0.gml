/// @description Insert description here
// You can write your code in this editor

if (instance_exists(ui_target)) {
	// Player stats
	draw_set_color(c_black);
	draw_set_font(fnt_main);
	draw_set_halign(fa_right);
	draw_text_transformed(
		camera_get_view_x(camera_get_active()) + camera_get_view_width(camera_get_active()) - 65,
		camera_get_view_y(camera_get_active()) + 5,
		"Health:",
		.5, .5, 0);
	draw_text_transformed(
		camera_get_view_x(camera_get_active()) + camera_get_view_width(camera_get_active()) - 5,
		camera_get_view_y(camera_get_active()) + 5,
		string(round(player_health)) + "/" + string(player_max_health),
		.5, .5, 0);
	draw_text_transformed(
		camera_get_view_x(camera_get_active()) + camera_get_view_width(camera_get_active()) - 65,
		camera_get_view_y(camera_get_active()) + 15,
		"Stamina:",
		.5, .5, 0);
	draw_text_transformed(
		camera_get_view_x(camera_get_active()) + camera_get_view_width(camera_get_active()) - 5,
		camera_get_view_y(camera_get_active()) + 15,
		string(round(player_stamina)) + "/" + string(player_max_stamina),
		.5, .5, 0);
		
	// Compound score
	draw_set_halign(fa_left);
	draw_text_transformed(
		camera_get_view_x(camera_get_active()) + 5,
		camera_get_view_y(camera_get_active()) + 5,
		"Stars: " + string(obj_game.player_star_count),
		.5, .5, 0);
		
	draw_text_transformed(
		camera_get_view_x(camera_get_active()) + 5,
		camera_get_view_y(camera_get_active()) + 15,
		"Circles: " + string(obj_game.player_circle_count),
		.5, .5, 0);
		
	draw_text_transformed(
		camera_get_view_x(camera_get_active()) + 5,
		camera_get_view_y(camera_get_active()) + 25,
		"Squares: " + string(obj_game.player_square_count),
		.5, .5, 0);
		
	draw_text_transformed(
		camera_get_view_x(camera_get_active()) + 5,
		camera_get_view_y(camera_get_active()) + 35,
		"Triangles: " + string(obj_game.player_triangle_count),
		.5, .5, 0);
	draw_set_alpha(1);
}