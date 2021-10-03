/// @description Insert description here
// You can write your code in this editor

player_max_health = 100;
player_health = player_max_health;

player_max_stamina = 100;
player_stamina = player_max_stamina;
player_stamina_drain_rate = .5;
player_stamina_regen_rate = .4;
player_is_recovering_stamina = false;

key_type_star = "STAR";
key_type_circle = "CIRCLE";
key_type_square = "SQUARE";
key_type_triangle = "TRIANGLE";

player_star_count = 0;
player_circle_count = 0;
player_square_count = 0;
player_triangle_count = 0;

max_room_time = room_speed * 120;
current_timer = max_room_time;

ui_target = obj_camera;

enum effects {
	fast_effect
}