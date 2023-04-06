
draw_set_font(f_debug);

// DELETE ALL OF THIS
debug_hsp = (xx - x) / x_force_divider;
debug_vsp = (yy - y) / y_force_divider;


draw_text(5, 5, "State: " + string(debug_states[state]));
draw_text(5, 15, "Hsp: " + string(hsp));
draw_text(5, 25, "Vsp: " + string(vsp));

switch(state) {
	case states.idle:
		draw_text(5, 35, "Angle: " + string(dir));
		draw_text(5, 45, "Vector Force: " + string("({0}, {1})", debug_hsp, debug_vsp));
		break;
	case states.crashed:
		draw_text(5, 35, "Bounce Decay: " + string(bounce_decay));
}

