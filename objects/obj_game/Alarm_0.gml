/// @description Insert description here
// You can write your code in this editor

var sound = irandom_range(1, 10);

if (sound == 1) {
	audio_sound_pitch(snd_lab_01, random_range(.9, 1.1));
	audio_play_sound(snd_lab_01, 5, false);
}
else if (sound == 2) {
	audio_sound_pitch(snd_lab_02, random_range(.9, 1.1));
	audio_play_sound(snd_lab_02, 5, false);
}
else if (sound == 3) {
	audio_sound_pitch(snd_lab_03, random_range(.9, 1.1));
	audio_play_sound(snd_lab_03, 5, false);
}
else if (sound == 4) {
	audio_sound_pitch(snd_lab_04, random_range(.9, 1.1));
	audio_play_sound(snd_lab_04, 5, false);
}
else if (sound == 5) {
	audio_sound_pitch(snd_lab_05, random_range(.9, 1.1));
	audio_play_sound(snd_lab_05, 5, false);
}
else if (sound == 6) {
	audio_sound_pitch(snd_lab_06, random_range(.9, 1.1));
	audio_play_sound(snd_lab_06, 5, false);
}
else if (sound == 7) {
	audio_sound_pitch(snd_lab_07, random_range(.9, 1.1));
	audio_play_sound(snd_lab_07, 5, false);
}
else if (sound == 8) {
	audio_sound_pitch(snd_lab_08, random_range(.9, 1.1));
	audio_play_sound(snd_lab_08, 5, false);
}
else if (sound == 9) {
	audio_sound_pitch(snd_lab_09, random_range(.9, 1.1));
	audio_play_sound(snd_lab_09, 5, false);
}
else if (sound == 10) {
	audio_sound_pitch(snd_lab_10, random_range(.9, 1.1));
	audio_play_sound(snd_lab_10, 5, false);
}
alarm[0] = room_speed * irandom_range(5, 10);