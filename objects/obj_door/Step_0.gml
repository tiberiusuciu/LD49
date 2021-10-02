/// @description Insert description here
// You can write your code in this editor

if (attempt_unlock) {
	if (
		obj_game.player_star_count == required_stars &&
		obj_game.player_circle_count == required_circles &&
		obj_game.player_square_count == required_squares &&
		obj_game.player_triangle_count == required_triangles
	) {		
		// win condition, go next level
	}
	else {
		obj_game.player_star_count = 0;
		obj_game.player_circle_count = 0;
		obj_game.player_square_count = 0;
		obj_game.player_triangle_count = 0;
	}
	
	attempt_unlock = false;
}