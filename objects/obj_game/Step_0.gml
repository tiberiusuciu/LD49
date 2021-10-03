/// @description Insert description here
// You can write your code in this editor

if (player_health <= 0) {
	show_debug_message("You died!");
}
else {
	player_health = min(player_health + health_regen - health_loss, player_max_health);
}

if (current_timer <= 0) {
	show_debug_message("TIMES UP!");
	// Lose condition
}
else {
	if (!stop_time) {
		current_timer -= 1 * drain_time_multiplier;
	}
}