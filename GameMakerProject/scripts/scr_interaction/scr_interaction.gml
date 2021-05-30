/*
	Insert description here
*/
function SetInteractionHighlight(_object){
	var controller = obj_controller_interaction;
	if (instance_exists(controller)) {
		if (controller.alarm[0] <= 0) {
			if (instance_exists(_object)) {
				with (controller) {
					if (highlightedObject == noone) {
						highlightedObject = _object;
						interactionMenuValues = GetInteractionNameListByValueMap(_object.interactions);
						selectedMenuIndex = 0;
					}
				}
			}
		}
	}
}

/*
	Insert description here
	param:
	return:
*/
function IsHighlighted(_object){
	var controller = obj_controller_interaction;
	var isHighlighted = false;
	if (instance_exists(controller)) {
		with (controller) {
			isHighlighted = (highlightedObject == _object);
		}
	}
	return isHighlighted;
}

function TriggerInteractionCooldown() {
	var controller = obj_controller_interaction;
	if (instance_exists(controller)) {
		with (controller) {
			alarm[0] = highlightCooldown;
		}
	}
}

/*
	Insert description here
*/
function ResetInteraction() {
	var controller = obj_controller_interaction;
	if (instance_exists(controller)) {
		with (controller) {
			highlightedObject = noone;
			interactionMenu = false;
			interactionMenuValues = noone;
			selectedMenuIndex = 0;	
		}
	}
}