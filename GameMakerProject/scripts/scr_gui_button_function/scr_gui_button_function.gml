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
	show_debug_message(item.Name);
}