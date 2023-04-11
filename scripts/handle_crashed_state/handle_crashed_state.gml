
function handle_crashed_state(){
	vsp += grv; // Apply gravity

	// Checks collisions
	collision_h = check_horizontal_collision(x + hsp, y, obj_solid);
	collision_v = check_vertical_collision(x, y + vsp, obj_solid);

	// Crash post horizontal collision behaviour
	if(collision_h) {
		hsp = -hsp;
	}

	// Crash post vertical collision behaviour
	if(collision_v) {
		if(sign(vsp) > 0) {
			bounce_off_floor();
		} else {
			vsp = 0;
		}
	}
	
	x += hsp;
	y += vsp;
}

function bounce_off_floor() {
	if(abs(vsp) > bounce_stop_threshold) {
		vsp *= -bounce_decay;
		hsp *= bounce_friction; 
		bounce_decay -= bounce_decay_sum;
	} else {
		hsp = 0;
		vsp = 0;
		bounce_decay = original_bounce_decay;
		state = states.idle;
	}
}
