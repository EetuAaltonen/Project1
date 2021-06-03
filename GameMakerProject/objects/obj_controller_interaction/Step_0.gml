/// @description Insert description here
// You can write your code in this editor
var interactionKeyReleased = keyboard_check_released(ord("Z"));
var menuKeyUp = keyboard_check_released(ord("W"));
var menuKeyDown = keyboard_check_released(ord("S"));
var menuKeySelect = keyboard_check_released(ord("E"));

var player = obj_player;

if (highlightedObject != noone) {
	if (!instance_exists(highlightedObject) || !instance_exists(player)) {
		ResetInteraction();
	} else {
		if (is_undefined(GetGUIStatement()) && interactionKeyReleased) {
			selectedMenuIndex = 0;
			SetGUIStatement(GUIStatement.ActionMenu);
		} else if (GetGUIStatement() == GUIStatement.ActionMenu) {
			var listSize = ds_list_size(interactionMenuValues);
			if (interactionKeyReleased) {
				ResetGUIStatement();
			} else if (menuKeyUp) {
				selectedMenuIndex = --selectedMenuIndex < 0 ? listSize - 1 : selectedMenuIndex;
			} else if (menuKeyDown) {
				selectedMenuIndex = ++selectedMenuIndex >= listSize ? 0 : selectedMenuIndex;
			} else if (menuKeySelect) {
				var interaction	= highlightedObject.interactions[selectedMenuIndex];
				switch (interaction) {
					case Interaction.Collect: {
						AddInventoryItem(highlightedObject.item);
						instance_destroy(highlightedObject);
					} break;
					case Interaction.Push: {
						InteractionPushObject(player, highlightedObject);
					} break;
				}
				ResetGUIStatement();
				ResetInteraction();
			}
		}
	}
}