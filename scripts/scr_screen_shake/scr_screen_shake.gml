
function screen_shake(magnitude, frames){
	with(obj_camera) {
		if(magnitude > shake_remain) {
			shake_magnitude = magnitude;
			shake_remain = magnitude;
			shake_length = frames;
		}
	}
}