/// @description Insert description here
// You can write your code in this editor

if (room == Room0) {
	draw_set_color(c_black);
	draw_set_alpha(.75);
	draw_rectangle(0, 0, room_width, room_height, false);
	draw_set_alpha(1);
	
	draw_set_font(fnt_main);
	
	draw_set_color(make_color_rgb(227, 94, 51));
	draw_text_transformed(20, 50, "Ludum", 2, 2, 0);
	draw_set_color(make_color_rgb(227, 139, 48));
	draw_text_transformed(190, 50, "Dare", 2, 2, 0);
	draw_set_color(make_color_rgb(250, 222, 55));
	draw_text_transformed(330, 50, "49", 2, 2, 0);
	
	draw_set_color(c_white);

	draw_text_transformed(20, 125, "tiberiusuciu and dkz1989\n\nPresents:", 1, 1, 0);

	draw_set_color(make_color_rgb(60, 38, 190));
	draw_set_color(c_yellow);
	draw_text_transformed(15, 190, "Larry's Whacky Alchemy Lab", 1.5, 1.5, 0);
	draw_set_color(c_white);
	
	var text01 = "The theme is:";
	var text02 = "Unstable";
	var text03 = "Keep feeding the machine the exact\nformula to avoid death!\n\nBeware that the compounds are unstable\nand might give you some side effects.\nGet the right amount of each compound\nto feed the machine 15 times and win!";
	var text04 = "Press any key to start";

	draw_text_transformed(20, 260, text01, 1.5, 1.5, 0);
	draw_set_color(c_red);
	draw_text_transformed(20, 300, text02, 2, 2, 0);
	draw_set_color(c_white);
	draw_text_transformed(20, 450, text03, 1.5, 1.5, 0);	
	
	draw_text_transformed(20, room_height - 60, text04, 1.5, 1.5, 0);
	
	var text04 = "Pro Tip: Stop by the stabilizer to\nremove any effects from the compounds";
	draw_text_transformed(room_width - 450, room_height - 40, text04, .75, .75, 0);
}
else if (room == Room1) {
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
		var compound_offset = 0;
		if (player_star_count > 0) {
			draw_text_transformed(
				camera_get_view_x(camera_get_active()) + 5,
				camera_get_view_y(camera_get_active()) + 5,
				"Stars: " + string(player_star_count),
				.5, .5, 0);
				
			compound_offset += 10;
		}
		
		if (player_circle_count > 0) {
			draw_text_transformed(
				camera_get_view_x(camera_get_active()) + 5,
				camera_get_view_y(camera_get_active()) + 5 + compound_offset,
				"Circles: " + string(player_circle_count),
				.5, .5, 0);
				
			compound_offset += 10;
		}
		
		if (player_square_count > 0) {
			draw_text_transformed(
				camera_get_view_x(camera_get_active()) + 5,
				camera_get_view_y(camera_get_active()) + 5 + compound_offset,
				"Squares: " + string(player_square_count),
				.5, .5, 0);
				
			compound_offset += 10;
		}
		
		if (player_triangle_count > 0) {
			draw_text_transformed(
				camera_get_view_x(camera_get_active()) + 5,
				camera_get_view_y(camera_get_active()) + 5 + compound_offset,
				"Triangles: " + string(player_triangle_count),
				.5, .5, 0);
				
			compound_offset += 10;
		}

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
}
else if (room == Room2) {
	
	draw_set_color(c_black);
	draw_set_alpha(.75);
	draw_rectangle(0, 0, room_width, room_height, false);
	draw_set_alpha(1);
	
	draw_set_font(fnt_main);
	draw_set_color(c_red);
	
	draw_text_transformed(20, 20, "Game Over", 1, 1, 0);
	
	draw_set_color(c_white);
	
	draw_text_transformed(20, 60, "At level " + string(obj_game.level) + ",", 1, 1, 0);
	draw_text_transformed(20, 80, obj_game.cause_of_death, 1, 1, 0);
	
	draw_set_color(c_yellow);
	draw_text_transformed(20, 120, "SCORE (" + string(player_score) + ")", 1, 1, 0);
	
	draw_set_color(c_white);
	
	draw_text_transformed(20, 160, "Thank you for playing our\nLudum Dare 49 entry", 1, 1, 0);
	draw_text_transformed(20, 240, "Made by\ntiberiusuciu and dkz1989", 1, 1, 0);

	draw_text_transformed(20, 350, "Special thanks to\nEmma and Cam for their contributions!", 1, 1, 0);

	draw_text_transformed(20, 690, "Press <escape> to quit\nor press <r> to restart", 1, 1, 0);
}
else if (room == Room3) {
	
	draw_set_color(c_black);
	draw_set_alpha(.75);
	draw_rectangle(0, 0, room_width, room_height, false);
	draw_set_alpha(1);
	
	draw_set_font(fnt_main);
	draw_set_color(c_lime);
	
	draw_text_transformed(20, 20, "You Win!", 1, 1, 0);
	
	draw_set_color(c_yellow);
	draw_text_transformed(20, 70, "SCORE (" + string(player_score) + ")", 1, 1, 0);
	
	draw_set_color(c_white);
	
	draw_text_transformed(20, 120, "Thank you for playing our\nLudum Dare 49 entry", 1, 1, 0);
	draw_text_transformed(20, 210, "Made by\ntiberiusuciu and dkz1989", 1, 1, 0);

	draw_text_transformed(20, 300, "Special thanks to\nEmma and Cam for the help\nwith arts and sounds!", 1, 1, 0);

	draw_text_transformed(20, 690, "Press <escape> to quit\nor press <r> to restart", 1, 1, 0);
}