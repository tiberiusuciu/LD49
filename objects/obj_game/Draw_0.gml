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
		"Stars: " + string(player_star_count),
		.5, .5, 0);
		
	draw_text_transformed(
		camera_get_view_x(camera_get_active()) + 5,
		camera_get_view_y(camera_get_active()) + 15,
		"Circles: " + string(player_circle_count),
		.5, .5, 0);
		
	draw_text_transformed(
		camera_get_view_x(camera_get_active()) + 5,
		camera_get_view_y(camera_get_active()) + 25,
		"Squares: " + string(player_square_count),
		.5, .5, 0);
		
	draw_text_transformed(
		camera_get_view_x(camera_get_active()) + 5,
		camera_get_view_y(camera_get_active()) + 35,
		"Triangles: " + string(player_triangle_count),
		.5, .5, 0);
	draw_set_alpha(1);
	
	// Timer
	var minutes = floor(current_timer / room_speed / 60)
	var seconds = floor(max((current_timer / room_speed - (minutes * 60)), 0))
	
	if (minutes < 10) {
		minutes = "0" + string(minutes);
	}
	if (seconds < 10) {
		seconds = "0" + string(seconds);
	}
	
	// "Timer: " + string(round(current_timer / room_speed)
	draw_text_transformed(
		camera_get_view_x(camera_get_active()) + 5,
		camera_get_view_y(camera_get_active()) + camera_get_view_height(camera_get_active()) - 15,
		"Time left: " + string(minutes) + "m" + string(seconds) + "s",
		.5, .5, 0)
	
	
	// Effects
	var offset = 0;
	draw_set_halign(fa_right);
	if (instance_exists(obj_slow_effect)) {
		var seconds = floor(max((obj_slow_effect.duration / room_speed), 0))
	
		if (seconds < 10) {
			seconds = "0" + string(seconds);
		}
		
		draw_text_transformed(
			camera_get_view_x(camera_get_active()) + camera_get_view_width(camera_get_active()) - 5,
			camera_get_view_y(camera_get_active()) + camera_get_view_height(camera_get_active()) - 15 - offset,
			"Slown down: " + string(seconds) + "s",
			.5, .5, 0)
		
		offset += 10;
	}
	if (instance_exists(obj_fast_effect)) {
		var seconds = floor(max((obj_fast_effect.duration / room_speed), 0))
	
		if (seconds < 10) {
			seconds = "0" + string(seconds);
		}
		
		draw_text_transformed(
			camera_get_view_x(camera_get_active()) + camera_get_view_width(camera_get_active()) - 5,
			camera_get_view_y(camera_get_active()) + camera_get_view_height(camera_get_active()) - 15 - offset,
			"Speed up: " + string(seconds) + "s",
			.5, .5, 0)
		
		offset += 10;
	}
	if (instance_exists(obj_heal_effect)) {
		var seconds = floor(max((obj_heal_effect.duration / room_speed), 0))
	
		if (seconds < 10) {
			seconds = "0" + string(seconds);
		}
		
		draw_text_transformed(
			camera_get_view_x(camera_get_active()) + camera_get_view_width(camera_get_active()) - 5,
			camera_get_view_y(camera_get_active()) + camera_get_view_height(camera_get_active()) - 15 - offset,
			"Healing up: " + string(seconds) + "s",
			.5, .5, 0)
		
		offset += 10;
	}
	
	if (instance_exists(obj_inf_stamina_effect)) {
		var seconds = floor(max((obj_inf_stamina_effect.duration / room_speed), 0))
	
		if (seconds < 10) {
			seconds = "0" + string(seconds);
		}
		
		draw_text_transformed(
			camera_get_view_x(camera_get_active()) + camera_get_view_width(camera_get_active()) - 5,
			camera_get_view_y(camera_get_active()) + camera_get_view_height(camera_get_active()) - 15 - offset,
			"Infinite Stamina: " + string(seconds) + "s",
			.5, .5, 0)
		
		offset += 10;
	}
	
	if (instance_exists(obj_stop_time_effect)) {
		var seconds = floor(max((obj_stop_time_effect.duration / room_speed), 0))
	
		if (seconds < 10) {
			seconds = "0" + string(seconds);
		}
		
		draw_text_transformed(
			camera_get_view_x(camera_get_active()) + camera_get_view_width(camera_get_active()) - 5,
			camera_get_view_y(camera_get_active()) + camera_get_view_height(camera_get_active()) - 15 - offset,
			"Time is stopped: " + string(seconds) + "s",
			.5, .5, 0)
		
		offset += 10;
	}
	
	if (instance_exists(obj_damage_over_time_effect)) {
		var seconds = floor(max((obj_damage_over_time_effect.duration / room_speed), 0))
	
		if (seconds < 10) {
			seconds = "0" + string(seconds);
		}
		
		draw_text_transformed(
			camera_get_view_x(camera_get_active()) + camera_get_view_width(camera_get_active()) - 5,
			camera_get_view_y(camera_get_active()) + camera_get_view_height(camera_get_active()) - 15 - offset,
			"Damage over time: " + string(seconds) + "s",
			.5, .5, 0)
		
		offset += 10;
	}
	
	if (instance_exists(obj_short_stamina_effect)) {
		var seconds = floor(max((obj_short_stamina_effect.duration / room_speed), 0))
	
		if (seconds < 10) {
			seconds = "0" + string(seconds);
		}
		
		draw_text_transformed(
			camera_get_view_x(camera_get_active()) + camera_get_view_width(camera_get_active()) - 5,
			camera_get_view_y(camera_get_active()) + camera_get_view_height(camera_get_active()) - 15 - offset,
			"Low Stamina: " + string(seconds) + "s",
			.5, .5, 0)
		
		offset += 10;
	}
	
	if (instance_exists(obj_confusion_effect)) {
		var seconds = floor(max((obj_confusion_effect.duration / room_speed), 0))
	
		if (seconds < 10) {
			seconds = "0" + string(seconds);
		}
		
		draw_text_transformed(
			camera_get_view_x(camera_get_active()) + camera_get_view_width(camera_get_active()) - 5,
			camera_get_view_y(camera_get_active()) + camera_get_view_height(camera_get_active()) - 15 - offset,
			"Confusion: " + string(seconds) + "s",
			.5, .5, 0)
		
		offset += 10;
	}
	
	if (instance_exists(obj_timer_drain_effect)) {
		var seconds = floor(max((obj_timer_drain_effect.duration / room_speed), 0))
	
		if (seconds < 10) {
			seconds = "0" + string(seconds);
		}
		
		draw_text_transformed(
			camera_get_view_x(camera_get_active()) + camera_get_view_width(camera_get_active()) - 5,
			camera_get_view_y(camera_get_active()) + camera_get_view_height(camera_get_active()) - 15 - offset,
			"Timer Drain: " + string(seconds) + "s",
			.5, .5, 0)
		
		offset += 10;
	}
	
	if (instance_exists(obj_slide_effect)) {
		var seconds = floor(max((obj_slide_effect.duration / room_speed), 0))
	
		if (seconds < 10) {
			seconds = "0" + string(seconds);
		}
		
		draw_text_transformed(
			camera_get_view_x(camera_get_active()) + camera_get_view_width(camera_get_active()) - 5,
			camera_get_view_y(camera_get_active()) + camera_get_view_height(camera_get_active()) - 15 - offset,
			"Slippery: " + string(seconds) + "s",
			.5, .5, 0)
		
		offset += 10;
	}
	
	draw_set_halign(fa_left);
}