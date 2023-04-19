
collision_effect = function() { 
	screen_shake(3, 10);
	with(obj_player) {
		hsp = -hsp;
		state = states.crashed;
	}
	return; 
}
