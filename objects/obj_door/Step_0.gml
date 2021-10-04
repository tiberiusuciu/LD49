/// @description Insert description here
// You can write your code in this editor

depth = -y

if (attempt_unlock) {
	if (
		obj_game.player_star_count == required_stars &&
		obj_game.player_circle_count == required_circles &&
		obj_game.player_square_count == required_squares &&
		obj_game.player_triangle_count == required_triangles
	) {
		obj_game.level += 1;
		obj_game.player_score += obj_game.level * 100;
		
		if (obj_game.level == 2) {
			required_stars = irandom_range(0, obj_game.level);
			required_circles = irandom_range(0, obj_game.level);
		}
		else if (obj_game.level == 3) {
			required_stars = irandom_range(0, obj_game.level);
			required_circles = irandom_range(0, obj_game.level);
			required_squares = irandom_range(0, obj_game.level);
		}
		else {
			required_stars = irandom_range(0, obj_game.level);
			required_circles = irandom_range(0, obj_game.level);
			required_squares = irandom_range(0, obj_game.level);
			required_triangles = irandom_range(0, obj_game.level);
		}
		
		obj_game.current_timer += room_speed * 10;
		audio_sound_pitch(snd_next_level, random_range(.9, 1.1));
		audio_play_sound(snd_next_level, 5, false);
	}
	else {
		audio_sound_pitch(snd_rejected, random_range(.9, 1.1));
		audio_play_sound(snd_rejected, 5, false);
	}
	obj_game.player_star_count = 0;
	obj_game.player_circle_count = 0;
	obj_game.player_square_count = 0;
	obj_game.player_triangle_count = 0;
	
	attempt_unlock = false;
}