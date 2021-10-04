/// @description Insert description here
// You can write your code in this editor

depth = -y;

var right = keyboard_check(ord("D")) || keyboard_check(vk_right);
var left = keyboard_check(ord("A")) || keyboard_check(vk_left);
var up = keyboard_check(ord("W")) || keyboard_check(vk_up);
var down = keyboard_check(ord("S")) || keyboard_check(vk_down);
var is_running = keyboard_check(vk_shift);
var spd = is_running ? r_spd : w_spd;
spd = spd * spd_multiplier * spd_nerf;
var is_opening_door = false;
var interact = keyboard_check_pressed(ord("E"));

// Checking if player is still recovering
if (instance_exists(obj_game) && obj_game.player_is_recovering_stamina) {
	spd = w_spd;
	is_running = false;
}

if (obj_game.is_sliding) {
	
	var tmp_right = keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right)
	var tmp_left = keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left);
	var tmp_up = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
	var tmp_down = keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down);
	var tmp_hspd = tmp_right - tmp_left;
	var tmp_vspd = tmp_down - tmp_up;
	if (hspd != 0 && tmp_hspd != 0) {
		hspd = min(hspd + random_range(.01, .25) * sign(tmp_hspd), 2);
	}
	else {
		hspd += (right - left) * spd;
	}
	
	if (vspd != 0 && tmp_vspd != 0) {
		vspd = min(vspd + random_range(.01, .25) * sign(tmp_vspd), 2);
	}
	else {
		vspd += (down - up) * spd;
	}
	
}
else {
	hspd += (right - left) * spd;
	vspd += (down - up) * spd;
}

if (obj_game.is_confused) {
	if (!obj_game.is_sliding) {
		hspd *= -1;
		vspd *= -1;
	}
	else {
		var tmp_right = keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right)
		var tmp_left = keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left);
		var tmp_up = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
		var tmp_down = keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down);
		var tmp_hspd = tmp_right - tmp_left;
		var tmp_vspd = tmp_down - tmp_up;
		if (tmp_hspd != 0) {
			hspd *= -1;
		}
		if (tmp_vspd != 0) {
			vspd *= -1;
		}
	}
}

// Animations
if (hspd != 0 || vspd != 0) {
	if (vspd < 0) {
		looking_direction = directions.up;
		sprite_index = spr_player_move_backwards_new;
	}
	else if (vspd > 0) {
		looking_direction = directions.down;
		sprite_index = spr_player_move;
	}
	
	image_speed = 2;
	
	if (is_running) {
		image_speed = 4;
	}
}
else {
	
	if (looking_direction == directions.up) {
		sprite_index = spr_player_move_backwards_new;
	}
	else if (looking_direction == directions.down) {
		sprite_index = spr_player_idle;
	}
	
	image_index = 0;
	image_index = 0;
	image_speed = 0;
}


// Horizontal collisions
if (place_meeting(x + hspd, y, obj_solid)) {
	while (!place_meeting(x + sign(hspd), y, obj_solid)) {
		x += sign(hspd);
	}
	
	if (place_meeting(x + sign(hspd), y, obj_door)) {
		is_opening_door = true;
	}
	
	hspd = 0;
}

// Vertical collisions
if (place_meeting(x, y + vspd, obj_solid)) {
	while (!place_meeting(x, y + sign(vspd), obj_solid)) {
		y += sign(vspd);
	}
	
	if (place_meeting(x, y + sign(vspd), obj_door)) {
		is_opening_door = true;
	}
	
	vspd = 0;
}

// stamina management
if (instance_exists(obj_game)) {
	if ((hspd != 0 || vspd != 0) && is_running && !obj_game.player_is_recovering_stamina && !obj_game.is_stamina_infinite) {
		obj_game.player_stamina = max(0, obj_game.player_stamina - (obj_game.player_stamina_drain_rate * obj_game.stamina_cost_multiplier));
	
		if (obj_game.player_stamina <= 0) {
			obj_game.player_is_recovering_stamina = true;
		}
	}
	else {
		obj_game.player_stamina = min(obj_game.player_max_stamina, obj_game.player_stamina + obj_game.player_stamina_regen_rate);
		if (obj_game.player_stamina == obj_game.player_max_stamina) {
			obj_game.player_is_recovering_stamina = false;
		}
	}
}

x += hspd;
y += vspd

if (!obj_game.is_sliding) {
	hspd = 0;
	vspd = 0;
}

var nearby_door = collision_rectangle(x - 32, y - 48, x + 32, y + 16, obj_door, false, true);

// player actions
if (interact) {
	var nearby_dispenser = collision_circle(x, y, 48, obj_dispenser, false, true);
	var nearby_health = collision_rectangle(x - 32, y - 48, x + 32, y + 16, obj_health, false, true);
	// collision_circle(x, y, 48, obj_door, false, true);
	// collision_rectangle(x - 32, y - 48, x + 32, y + 16, obj_door, false, true);
	
	// activating a dispenser
	if (nearby_dispenser != noone) {
		with(nearby_dispenser) {
			is_dispensing = true;
		}
	}
	
	// interacting with nearby door
	if (nearby_door != noone) {
		obj_door.attempt_unlock = true;
	}
	
	// interacting with nearby healing station
	if (nearby_health != noone) {
		obj_game.player_health = obj_game.player_max_health;
		with (obj_effect) {
			instance_destroy(self);
		}
	}
	
}

// Getting door info
if (nearby_door != noone) {
	with(nearby_door) {
		obj_door.show_door_requirements = true;
	}
}
else {
	obj_door.show_door_requirements = false;
}