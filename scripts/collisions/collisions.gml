
function check_horizontal_collision(xx, yy, obj) {
	if(place_meeting(xx, yy, obj)) {
		aux_hsp = hsp;
		while(abs(hsp) > 0.1) {
			hsp *= 0.5;
			if(!place_meeting(xx, yy, obj)) x += hsp;
		}
		hsp = aux_hsp;
		return true;
	}
	return false;
}

function check_vertical_collision(xx, yy, obj) {
	if(place_meeting(x, y + vsp, obj_solid)) {
		aux_vsp = vsp;
		while(abs(vsp) > 0.1) {
			vsp *= 0.5;
			if(!place_meeting(x, y + vsp, obj_solid)) y += vsp;
		}
		vsp = aux_vsp;
		return true;
	}
	return false;
}

