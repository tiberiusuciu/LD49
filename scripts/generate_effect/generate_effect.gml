// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function generate_effect(){
	var chosen_effect = irandom_range(0, obj_game.number_of_effects - 1);
	show_debug_message("Chosen effect ID: " + string(chosen_effect));
	
	switch (chosen_effect) {
	
		case obj_game.effects.fast_effect:
			if (instance_exists(obj_fast_effect)) {
				obj_fast_effect.duration = obj_effect.initial_duration;
			}
			else {
				instance_create_layer(0, 0, "instances", obj_fast_effect);
			}
		break;
		case obj_game.effects.slow_effect:
			if (instance_exists(obj_slow_effect)) {
				obj_slow_effect.duration = obj_effect.initial_duration;
			}
			else {
				instance_create_layer(0, 0, "instances", obj_slow_effect);
			}
		break;
		case obj_game.effects.healing_over_time:
			if (instance_exists(obj_heal_effect)) {
				obj_heal_effect.duration = obj_effect.initial_duration;
			}
			else {
				instance_create_layer(0, 0, "instances", obj_heal_effect);
			}
		break;
		case obj_game.effects.infinite_stamina:
			if (instance_exists(obj_inf_stamina_effect)) {
				obj_inf_stamina_effect.duration = obj_effect.initial_duration;
			}
			else {
				instance_create_layer(0, 0, "instances", obj_inf_stamina_effect);
			}
		break;
		case obj_game.effects.stop_time:
			if (instance_exists(obj_stop_time_effect)) {
				obj_stop_time_effect.duration = obj_effect.initial_duration;
			}
			else {
				instance_create_layer(0, 0, "instances", obj_stop_time_effect);
			}
		break;
		case obj_game.effects.damage_over_time:
			if (instance_exists(obj_damage_over_time_effect)) {
				obj_damage_over_time_effect.duration = obj_effect.initial_duration;
			}
			else {
				instance_create_layer(0, 0, "instances", obj_damage_over_time_effect);
			}
		break;
		case obj_game.effects.short_stamina:
			if (instance_exists(obj_short_stamina_effect)) {
				obj_short_stamina_effect.duration = obj_effect.initial_duration;
			}
			else {
				instance_create_layer(0, 0, "instances", obj_short_stamina_effect);
			}
		break;
		case obj_game.effects.confusion:
			if (instance_exists(obj_confusion_effect)) {
				obj_confusion_effect.duration = obj_effect.initial_duration;
			}
			else {
				instance_create_layer(0, 0, "instances", obj_confusion_effect);
			}
		break;
		case obj_game.effects.drain_time:
			if (instance_exists(obj_timer_drain_effect)) {
				obj_timer_drain_effect.duration = obj_effect.initial_duration;
			}
			else {
				instance_create_layer(0, 0, "instances", obj_timer_drain_effect);
			}
		break;
		case obj_game.effects.slide_effect:
			if (instance_exists(obj_slide_effect)) {
				obj_slide_effect.duration = obj_effect.initial_duration;
			}
			else {
				instance_create_layer(0, 0, "instances", obj_slide_effect);
			}
		break;
	}
}