
switch(state) {
	case states.idle:
		handle_idle_state();
		break;
	case states.jumping:
		handle_jumping_state();
		break;
	case states.crashed:
		handle_crashed_state();
		break;
	default:
		break;
}
