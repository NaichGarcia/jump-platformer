
function handle_idle_state() {
	xx = mouse_x;
	yy = mouse_y;
		
	// Calculate distance and direction
	dir = point_direction(x, y, mouse_x, mouse_y);
	var dist = point_distance(x, y, mouse_x, mouse_y);

	// If distance is greater than max distance, then cap it
	if(dist > MAX_MAGNITUDE) {
		xx = x + lengthdir_x(MAX_MAGNITUDE, dir);
		yy = y + lengthdir_y(MAX_MAGNITUDE, dir);
	}

	// Checks if there's a collision with a wall
	var r = collision_line_point(x, y, xx, yy, obj_solid, true, true); 
	if(r[0] != noone) {
		xx = r[1];
		yy = r[2];
	}
	
	// Check mouse button when IDLE
	apply_input_force();
}

function apply_input_force(debug=false) {
	if(mouse_check_button_pressed(mb_left)) {
		hsp = (xx - x) / x_force_divider;
		vsp = (yy - y) / y_force_divider;
			
		state = states.jumping;
		if(debug) { show_debug_message("Vector: ({0}, {1})", hsp, vsp); }
	}
}
