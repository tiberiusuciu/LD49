/// @description Insert description here
// You can write your code in this editor

if (is_dispensing) {
	if (type == obj_game.key_type_star) {
		obj_game.player_star_count += 1;
	}
	else if (type == obj_game.key_type_circle) {
		obj_game.player_circle_count += 1;
	}
	else if (type == obj_game.key_type_square) {
		obj_game.player_square_count += 1;
	}
	else if (type == obj_game.key_type_triangle) {
		obj_game.player_triangle_count += 1;
	}
	
	
	
	// give effect
	generate_effect();
	generate_effect();
	generate_effect();
	generate_effect();
	generate_effect();
	
	is_dispensing = false;
}