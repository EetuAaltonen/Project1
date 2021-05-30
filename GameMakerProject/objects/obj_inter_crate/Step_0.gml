/// @description Insert description here
// You can write your code in this editor
vSpeed += global.GRAVITY
if (place_meeting(x, y + vSpeed, obj_collision_parent)) {
	while (!place_meeting(x, y + sign(vSpeed), obj_collision_parent)) {
		y += sign(vSpeed);
	}
	vSpeed = 0;
};
y += vSpeed;

//Highlight
var selfObject = self;
if (instance_exists(obj_player)) {
	if (instance_exists(obj_controller_highlight)) {
		if (!highlighted) {
			if (distance_to_object(obj_player) <= 20) {
				with (obj_controller_highlight) {
					if (highlightedObject == noone) {
						highlightedObject = selfObject;
						selfObject.highlighted = true;
					}
				}
			}
		} else {
			if (distance_to_object(obj_player) > 20) {
				with (obj_controller_highlight) {
					if (highlightedObject == selfObject) {
						highlightedObject = noone;
						selfObject.highlighted = false;
					}
				}
			}
		}
	}
}