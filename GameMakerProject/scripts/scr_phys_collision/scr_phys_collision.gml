/*
	Insert description here
	param: _object - Insert description here
*/
function IsGrounded(_object) {
	if (instance_exists(_object)) {
		with (_object) {
			return place_meeting(x, y + 1, obj_collision_parent);	
		}
	}
}

/*
	Insert description here
	param: _object - Insert description here
*/
function FrictionSlowing(_object) {
	if (instance_exists(_object)) {
		with (_object) {
			return lerp(speedVector.x, 0, 0.1);
		}
	}
}

/*
	Insert description here
	param: _source - Insert description here
	return: 
*/
function HorizontalCollision(_object) {
	if (instance_exists(_object)) {
		with (_object) {
			if (place_meeting(x + speedVector.x, y, obj_collision_parent)) {
				while (!place_meeting(x + sign(speedVector.x), y, obj_collision_parent)) {
					x += sign(speedVector.x);
				}
				speedVector.x = 0;
			}
			
			if (x + speedVector.x < 0) {
				while (x + speedVector.x >= 0) {
					x += sign(speedVector.x);
				}
				speedVector.x = 0;
			} else if (x + speedVector.x > room_width) {
				while (x + speedVector.x <= room_width) {
					x += sign(speedVector.x);
				}
				speedVector.x = 0;
			}
			
			return speedVector.x;
		}
	}
}

/*
	Insert description here
	param: _source - Insert description here
	return: 
*/
function VerticalCollision(_object) {
	if (instance_exists(_object)) {
		with (_object) {
			if (place_meeting(x, y + speedVector.y, obj_collision_parent)) {
				while (!place_meeting(x, y + sign(speedVector.y), obj_collision_parent)) {
					y += sign(speedVector.y);
				}
				speedVector.y = 0;
			}
			
			if (y + speedVector.y < 0) {
				while (y + speedVector.y >= 0) {
					y += sign(speedVector.y);
				}
				speedVector.y = 0;
			} else if (y + speedVector.y > room_height) {
				while (y + speedVector.y <= room_height) {
					y += sign(speedVector.y);
				}
				speedVector.y = 0;
			}
			
			return speedVector.y;
		}
	}
}