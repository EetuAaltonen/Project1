var controllers = [
	obj_controller_game,
	obj_controller_gui,
	obj_controller_interaction
];
var controllerLayer = layer_get_id("Controllers");
var arrayLength = array_length(controllers);
for (var i = 0; i < arrayLength; i++) {
	var controller = controllers[i];
	instance_create_layer(0, 0, controllerLayer, controller);
}