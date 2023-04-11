
function handle_jumping_state(){
	vsp += grv; // Apply gravity

	// Checks collisions
	collision_h = check_horizontal_collision(x + hsp, y, obj_solid);
	collision_v = check_vertical_collision(x, y + vsp, obj_solid);
	
	// Jump post horizontal collision behaviour
	if(collision_h) {
		hsp = -hsp;
		state = states.crashed;	
	}
	
	// Jump post vertical collision behaviour
	if(collision_v) {
		if(sign(vsp) > 0) {
			hsp = 0;
			state = states.idle;
		}
		vsp = 0;
	}
	
	x += hsp;
	y += vsp;
}