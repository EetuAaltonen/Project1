/// @description Insert description here
var inventoryKey = keyboard_check_released(vk_tab);
var escKey = keyboard_check_released(vk_escape);
var guiStatement = GetGUIStatement();

if (is_undefined(guiStatement)) {
	if (inventoryKey) {
		RequestGUIStatementSet(GUIStatement.Inventory);
		inventoryRenderData = GetInventoryAllItems();
	}
} else {
	if (inventoryKey || escKey) {
		if (guiStatement == GUIStatement.Inventory) { RequestGUIStatementReset(); }
	}
}

