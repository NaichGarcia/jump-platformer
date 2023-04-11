
x = 0;
y = follow.y - (camera_height / 2) - y_offset;

x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);

shake_remain = max(0, shake_remain - ((1 / shake_length) * shake_magnitude));

camera_set_view_pos(camera, x, y);
