/*
	Insert description here
	param: _angle - Insert description here
	param: _speed - Insert description here
	return:
*/
function GetGUIStatement() {
	var controller = obj_controller_gui;
	var statement = undefined;
	if (instance_exists(controller)) {
		with (controller) {
			statement = guiStatement;	
		}
	}
	return statement;
}

/*
	Insert description here
	param: _angle - Insert description here
	return:
*/
function RequestGUIStatementSet(_guiStatement) {
	var controller = obj_controller_gui;
	if (instance_exists(controller)) {
		with (controller) {
			if (guiStatement != _guiStatement) {
				RequestGUIStatementChange();
				guiStatement = _guiStatement;
				switch (_guiStatement) {
					case GUIStatement.Inventory: {
						OpenGUIStatementInventory();
					} break;
				}
			}
		}
	}
}

/*
	Insert description here
	param: _angle - Insert description here
	return:
*/
function RequestGUIStatementReset() {
	RequestGUIStatementSet(undefined);
}

/*
	Insert description here
	param: _angle - Insert description here
	return:
*/
function RequestGUIStatementChange() {
	var controller = obj_controller_gui;
	if (instance_exists(controller)) {
		with (controller) {
			switch (guiStatement) {
				case GUIStatement.Inventory: {
					CloseGUIStatementInventory();
				} break;
			}
		}
	}
}

/*
	Insert description here
	return:
*/
function OpenGUIStatementInventory() {
	var intentoryControls = GetDbGUIButtonGroupByIndex(GUIButtonGroupIndex.InventoryControls);
	AddGUIButtonGroupActive(intentoryControls);
	
	var inventoryItemList = GetDbGUIButtonGroupByIndex(GUIButtonGroupIndex.InventoryItemList);
	AddGUIButtonGroupActive(inventoryItemList);
	
	with (obj_controller_gui) {
		inventoryPageIndex = 0;
		inventoryRefresh = true;
	}
}

/*
	Insert description here
	return:
*/
function CloseGUIStatementInventory() {
	RemoveGUIButtonGroupActiveByIndex(GUIButtonGroupIndex.InventoryControls);
	RemoveGUIButtonGroupActiveByIndex(GUIButtonGroupIndex.InventoryItemList);
}