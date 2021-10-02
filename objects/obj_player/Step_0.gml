/// @description Insert description here
// You can write your code in this editor

depth = -y;

var right = keyboard_check(ord("D")) || keyboard_check(vk_right);
var left = keyboard_check(ord("A")) || keyboard_check(vk_left);
var up = keyboard_check(ord("W")) || keyboard_check(vk_up);
var down = keyboard_check(ord("S")) || keyboard_check(vk_down);
var is_running = keyboard_check(vk_shift);
var spd = is_running ? r_spd : w_spd;
var is_opening_door = false;
var interact = keyboard_check_pressed(ord("E"));

// Checking if player is still recovering
if (instance_exists(obj_game) && obj_game.player_is_recovering_stamina) {
	spd = w_spd;
	is_running = false;
}

hspd += (right - left) * spd;
vspd += (down - up) * spd;


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
	if ((hspd != 0 || vspd != 0) && is_running && !obj_game.player_is_recovering_stamina) {
		obj_game.player_stamina = max(0, obj_game.player_stamina - obj_game.player_stamina_drain_rate);
	
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

if (is_opening_door) {
	show_debug_message("OK!");
}

x += hspd;
y += vspd;
hspd = 0;
vspd = 0;

var nearby_door = collision_rectangle(x - 32, y - 48, x + 32, y + 16, obj_door, false, true);
// collision_circle(x, y, 48, obj_door, false, true);
// collision_rectangle(x - 32, y - 48, x + 32, y + 16, obj_door, false, true);


// player actions
if (interact) {
	var nearby_dispenser = collision_circle(x, y, 48, obj_dispenser, false, true);
	
	// activating a dispenser
	if (nearby_dispenser != noone) {
		with(nearby_dispenser) {
			is_dispensing = true;
		}
	}
	
	if (nearby_door != noone) {
		obj_door.attempt_unlock = true;
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