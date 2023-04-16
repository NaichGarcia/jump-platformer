
collision_effect = function() { 
	show_debug_message("PASA");
	screen_shake(3, 10);
	with(obj_player) {
		hsp = -hsp;
		state = states.crashed;
	}
	return; 
}
