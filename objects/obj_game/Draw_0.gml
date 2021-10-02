/// @description Insert description here
// You can write your code in this editor

if (instance_exists(ui_target)) {
	draw_set_color(c_black);
	draw_set_font(fnt_main);
	draw_text_transformed(
		camera_get_view_x(camera_get_active()) + 5,
		camera_get_view_y(camera_get_active()) + 5,
		"Health: " + string(round(player_health)) + "/" + string(player_max_health),
		.5, .5, 0);
	draw_text_transformed(
		camera_get_view_x(camera_get_active()) + 5,
		camera_get_view_y(camera_get_active()) + 15,
		"Stamina: " + string(round(player_stamina)) + "/" + string(player_max_stamina),
		.5, .5, 0);
	draw_set_alpha(1);
}