/*
	Insert description here
	param: _guiStatement - Insert description here
*/
function ButtonFuncResetGUIStatement() {
	RequestGUIStatementReset();
}

/*
	Insert description here
	param: _guiStatement - Insert description here
*/
function ButtonFuncSetGUIStatement(_guiStatement) {
	RequestGUIStatementSet(_guiStatement);
}

/*
	Insert description here
	param: _guiStatement - Insert description here
*/
function ClickedButtonFuncInventoryItem(_index) {
	var dropKey = keyboard_check(vk_shift);
	var item = GetInventoryItemByIndex(_index);
	
	if (dropKey) {
		// Drop item
		AddInventoryItem(item, -1);
	} else {
		// Toggle item equipping
		if (!is_undefined(item.EquipmentSlot)) {
			ToggleInventoryItemEquip(item);
		}
	}
}