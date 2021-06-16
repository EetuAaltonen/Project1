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
	var item = GetInventoryItemByIndex(_index);
	if (!is_undefined(item.EquipSlot)) {
		ToggleInventoryItemEquip(item);
	}
}