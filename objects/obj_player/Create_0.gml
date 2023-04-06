
grv = 0.4;
hsp = 0;
vsp = 0;

x_force_divider = 12;
y_force_divider = 10;

bounce_decay = 0.65;
bounce_stop_threshold = 5;

enum states {
	idle,
	jumping,
	crashed
}
debug_states = ["idle", "jumping", "crashed"];

state = states.idle;
