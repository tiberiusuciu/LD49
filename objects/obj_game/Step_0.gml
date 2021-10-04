/// @description Insert description here
// You can write your code in this editor

depth = -9999999999;

if (room == Room0) {
	if (keyboard_check_pressed(vk_anykey)) {
		room_goto_next();
	}
}
else if(room == Room1) {
	if (player_health <= 0) {
		cause_of_death = "Larry was too unstable, he de-materialized!";
		audio_sound_pitch(snd_die, random_range(.9, 1.1));
		audio_play_sound(snd_die, 5, false);
		alarm[0] = -1;
		room_goto_next();
	}
	else {
		player_health = min(player_health + health_regen - health_loss, player_max_health);
	}

	if (current_timer <= 0) {
		cause_of_death = "Larry's machine ran out of time, everything melted!";
		audio_sound_pitch(snd_die, random_range(.9, 1.1));
		audio_play_sound(snd_die, 5, false);
		alarm[0] = -1;
		room_goto_next();
	}
	else {
		if (!stop_time) {
			current_timer -= 1 * drain_time_multiplier;
		}
	}
	
	if (level >= 15) {
		room_goto(Room3)
		alarm[0] = -1;
	}
	if (alarm[0] == -1) {
		show_debug_message("start ambiance");
		alarm[0] = room_speed * irandom_range(1, 10);
	}
}
else if (room == Room2 || room == Room3) {
	if (keyboard_check_pressed(vk_escape)) {
		game_end();
	}
	else if (keyboard_check_pressed(ord("R"))) {
		game_restart();
	}
}