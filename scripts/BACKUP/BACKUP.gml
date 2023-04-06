/*
switch(state) {
	case states.idle:
		xx = mouse_x;
		yy = mouse_y;
		
		// Calculate distance and direction
		var dir = point_direction(x, y, mouse_x, mouse_y);
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
		if(mouse_check_button_pressed(mb_left)) {
			hsp = (xx - x) / force_divider;
			vsp = (yy - y) / force_divider;
			
			state = states.jumping;
			show_debug_message("Vector: ({0}, {1})", hsp, vsp);
		}
		break;
	case states.jumping:
		// Gravity
		vsp += grv;

		// Checks horizontal collision
		if(place_meeting(x + hsp, y, obj_solid)) {
			hsp_aux = hsp;
			while(abs(hsp) > 0.1) {
				hsp *= 0.5;
				if(!place_meeting(x + hsp, y, obj_solid)) x += hsp;
			}
			hsp = hsp_aux * -1;
			state = states.crashed;
			break;
		}
		x += hsp;

		// Checks vertical collision
		if(place_meeting(x, y + vsp, obj_solid)) {
			vsp_aux = vsp;
			while(abs(vsp) > 0.1) {
				vsp *= 0.5;
				if(!place_meeting(x, y + vsp, obj_solid)) y += vsp;
			}
			if(sign(vsp) > 0) {
				state = states.idle;
				break;
			} 
			if(sign(vsp) < 0) {
				vsp = vsp_aux * -1;
				break;
			}
			show_debug_message("estado: {0}", vsp);
			vsp = 0;
		}
		y += vsp;
	case states.crashed:
		vsp += grv;

		// Checks horizontal collision
		if(place_meeting(x + hsp, y, obj_solid)) {
			hsp_aux = hsp;
			while(abs(hsp) > 0.1) {
				hsp *= 0.5;
				if(!place_meeting(x + hsp, y, obj_solid)) x += hsp;
			}
			hsp = hsp_aux * -1;
		}
		x += hsp;

		// Checks vertical collision
		if(place_meeting(x, y + vsp, obj_solid)) {
			while(abs(vsp) > 0.1) {
				vsp *= 0.5;
				if(!place_meeting(x, y + vsp, obj_solid)) y += vsp;
			}
			if(abs(vsp) < bounce_stop_threshold) {
				state = states.idle;
				break;
			}
			vsp *= -bounce_multiplier;
		}
		y += vsp;
	default:
		break;
}

//show_debug_message("estado: {0}", state);
*/
/*-----------------------------------------------------------------------------------------*/
/*
vsp += grv;

// Checks horizontal collision
if(place_meeting(x + hsp, y, obj_solid)) {
	while(abs(hsp) > 0.1) {
		hsp *= 0.5;
		if(!place_meeting(x + hsp, y, obj_solid)) x += hsp;
	}
	hsp = 0;
}
x += hsp;

// Checks vertical collision
if(place_meeting(x, y + vsp, obj_solid)) {
	while(abs(vsp) > 0.1) {
		vsp *= 0.5;
		if(!place_meeting(x, y + vsp, obj_solid)) y += vsp;
	}
	vsp = 0;
}
y += vsp;

xx = mouse_x;
yy = mouse_y;
		
// Calculate distance and direction
var dir = point_direction(x, y, mouse_x, mouse_y);
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
if(mouse_check_button_pressed(mb_left)) {
	hsp = (xx - x) / force_divider;
	vsp = (yy - y) / force_divider;
			
	state = states.jumping;
	show_debug_message("Vector: ({0}, {1})", hsp, vsp);
}

*/

/*
switch(state) {
	case states.idle:
		xx = mouse_x;
		yy = mouse_y;
		
		// Calculate distance and direction
		var dir = point_direction(x, y, mouse_x, mouse_y);
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
		if(mouse_check_button_pressed(mb_left)) {
			hsp = (xx - x) / x_force_divider;
			vsp = (yy - y) / y_force_divider;
			
			//state = states.jumping;
			show_debug_message("Vector: ({0}, {1})", hsp, vsp);
		}

		vsp += grv; // Apply gravity

		// Checks horizontal collision
		if(place_meeting(x + hsp, y, obj_solid)) {
			aux_hsp = hsp;
			while(abs(hsp) > 0.1) {
				hsp *= 0.5;
				if(!place_meeting(x + hsp, y, obj_solid)) x += hsp;
			}
			hsp = aux_hsp * -1;
			crashed = true;
		}
		x += hsp;

		// Checks vertical collision
		if(place_meeting(x, y + vsp, obj_solid)) {
			aux_vsp = vsp;
			while(abs(vsp) > 0.1) {
				vsp *= 0.5;
				if(!place_meeting(x, y + vsp, obj_solid)) y += vsp;
			}
			vsp = aux_vsp;
			if(sign(vsp) > 0) {
		
					hsp = 0;
					crashed = false;
					//vsp = 0;
			}
			vsp = 0;
		}
		y += vsp;
		
		break;
		
	case states.jumping:
		
		break;
}



*/
