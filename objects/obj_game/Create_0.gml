/// @description Insert description here
// You can write your code in this editor

randomize();

player_max_health = 100;
player_health = player_max_health;
health_regen = 0;
health_loss = 0;

player_max_stamina = 100;
player_stamina = player_max_stamina;
player_stamina_drain_rate = .5;
player_stamina_regen_rate = .4;
player_is_recovering_stamina = false;
is_stamina_infinite = false;
stamina_cost_multiplier = 1;

key_type_star = "STAR";
key_type_circle = "CIRCLE";
key_type_square = "SQUARE";
key_type_triangle = "TRIANGLE";

player_star_count = 0;
player_circle_count = 0;
player_square_count = 0;
player_triangle_count = 0;

is_sliding = false;

max_room_time = room_speed * 120;
current_timer = max_room_time;
stop_time = false;
drain_time_multiplier = 1;

ui_target = obj_camera;

is_confused = false;

number_of_effects = 10;
enum effects {
	fast_effect,
	slow_effect,
	healing_over_time,
	infinite_stamina,
	stop_time,
	damage_over_time,
	short_stamina,
	confusion,
	drain_time,
	slide_effect
}

