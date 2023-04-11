
function check_horizontal_collision(xx, yy, obj) {
	if(place_meeting(xx, yy, obj)) {
		var collision_id = get_collision_id(xx, yy, obj);
		
		aux_hsp = hsp;
		while(abs(hsp) > 0.1) {
			hsp *= 0.5;
			if(!place_meeting(xx, yy, obj)) x += hsp;
		}
		hsp = aux_hsp;

		show_debug_message(object_get_name(collision_id.object_index));
		return collision_id;
	}
	return noone;
}

function check_vertical_collision(xx, yy, obj) {
	if(place_meeting(x, y + vsp, obj_solid)) {
		var collision_id = get_collision_id(xx, yy, obj);
		
		aux_vsp = vsp;
		while(abs(vsp) > 0.1) {
			vsp *= 0.5;
			if(!place_meeting(x, y + vsp, obj_solid)) y += vsp;
		}
		vsp = aux_vsp;
		
		show_debug_message(object_get_name(collision_id.object_index));
		return collision_id;
	}
	return noone;
}

function get_collision_id(xx, yy, obj) {
	// We need to offset the coordinate because the player origin is at the center
	var x_offset = sprite_width / 2 * sign(hsp);
	var y_offset = sprite_height / 2 * sign(vsp);
	return collision_rectangle(x - x_offset, y - y_offset, xx + x_offset, yy + y_offset, obj, true, true);
}