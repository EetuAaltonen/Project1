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
		itemListPageIndex= 0;
		itemListRefresh = true;
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

/*
	Insert description here
	return:
*/
function RequestInventoryItemListUpdate() {
	var controller = obj_controller_gui;
	if (instance_exists(controller)) {
		with (controller) {
			controller.itemListRefresh = true;
		}
	}
}