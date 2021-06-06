/*
	Insert description here
*/
function CheckInteractionHighlightSelf(_self) {
	if (instance_exists(obj_player)) {
		if (IsHighlighted(_self)) {
			if (distance_to_object(obj_player) > 20) {
				if (IsHighlighted(_self)) {
					ResetInteraction();
				}
			}
		} else {
			if (distance_to_object(obj_player) <= 20) {
				SetInteractionHighlight(_self);
			}
		}
	}
}

/*
	Insert description here
*/
function DrawInteractionHighlightSelf(_self) {
	// Highlight shader
	var highlightShader = sh_highlight_self;
	shader_set(highlightShader);

	var texture = sprite_get_texture(_self.sprite_index, _self.image_index);
	var textureWidth = texture_get_texel_width(texture);
	var textureHeight = texture_get_texel_height(texture);
	var uniformHandle = shader_get_uniform(highlightShader, "texture_Pixel");
	shader_set_uniform_f(uniformHandle, textureWidth, textureHeight);
	draw_self();

	shader_reset();
}

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
						interactionMenuValues = GetDbInteractionListByIndexArray(_object.interactions);
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
			interactionMenuValues = undefined;
			selectedMenuIndex = 0;
		}
	}
}