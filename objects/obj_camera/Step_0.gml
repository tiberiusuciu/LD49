if (instance_exists(target)) {
	x = lerp(x, target.x, .1);
	y = lerp(y, target.y - 8, .1);
	
	x = clamp(x, width / 2, room_width - width / 2);
	y = clamp(y, height / 2, room_height - height / 2);	
	
	camera_set_view_pos(view_camera[0], x - width / 2, y - height / 2);
}