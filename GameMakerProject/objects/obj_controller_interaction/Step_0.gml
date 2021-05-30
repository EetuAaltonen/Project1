/// @description Insert description here
// You can write your code in this editor
var interactionKey = ord("Z");
var menuKeyUp = ord("W");
var menuKeyDown = ord("S");
var menuKeySelect = ord("E");

var player = obj_player;

if (highlightedObject != noone) {
	if (!instance_exists(highlightedObject) || !instance_exists(player)) {
		ResetInteraction();
	} else {
		interactionMenu = keyboard_check(interactionKey) ? true : false;
		if (keyboard_check_released(interactionKey)) { selectedMenuIndex = 0; }
	
		if (interactionMenu) {
			var listSize = ds_list_size(interactionMenuValues);
			if (keyboard_check_released(menuKeyUp)) {
				selectedMenuIndex = --selectedMenuIndex < 0 ? listSize - 1 : selectedMenuIndex;
			} else if (keyboard_check_released(menuKeyDown)) {
				selectedMenuIndex = ++selectedMenuIndex >= listSize ? 0 : selectedMenuIndex;
			} else if (keyboard_check_released(menuKeySelect)) {
				var selectedInteraction	= highlightedObject.interactions[selectedMenuIndex];
				InteractionPushObject(player, highlightedObject);
				ResetInteraction();
			}
		}
	}
}