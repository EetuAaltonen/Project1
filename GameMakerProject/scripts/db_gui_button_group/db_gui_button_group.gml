/*
	Insert description here
	return:
*/
function CreateDbGUIButtonGroupMap() {
	var buttonGroupMap = ds_map_create();
	var allButtonGroup = GetDbAllGUIButtonGroupArray();
	var allButton = GetDbAllGUIButtonArray();
	var arrayLength = array_length(allButtonGroup);
	var buttonArrayLength = array_length(allButton);
	
	for (var i = 0; i < arrayLength; i++) {
		var buttonGroup = allButtonGroup[i];
		for (var j = 0; j < buttonArrayLength; j++) {
			var button = allButton[j];
			if (button.ButtonGroupIndex == buttonGroup.Index) {
				switch (buttonGroup.Index) {
					case GUIButtonGroupIndex.InventoryItemList: {
						var itemsPerPage = 12;
						for (var k = 0; k < itemsPerPage; k++) {
							buttonGroup.AddGUIButton(button);
						}
					} break;
					default: {
						buttonGroup.AddGUIButton(button);	
					}
				}
			}
		}
		buttonGroupMap [? buttonGroup.Index] = buttonGroup;
	}
	
	return buttonGroupMap;
}

/*
	Insert description here
	return:
*/
function GetDbGUIButtonGroupByIndex(_index) {
	with (obj_controller_database) {
		return ds_map_find_value(dbGUIButtonGroupMap, _index);
	}
}

/*
	Insert description here
	return:
*/
function GetDbAllGUIButtonGroupArray() {
	return [
		new GUIButtonGroup(GUIButtonGroupIndex.InventoryControls),
		new GUIButtonGroup(GUIButtonGroupIndex.InventoryItemList)
	];
}

/*
	Insert description here
	return:
*/
function GetDbAllGUIButtonArray() {
	return [
		new GUIButton(GUIButtonGroupIndex.InventoryControls, spr_gui_button_inventory, new Vector2(1220, 70), new Size(100, 40), "Close", GetDbFontPresetByIndex(FontPreset.GeneralMedium), undefined, "TestButton", undefined, ButtonFuncResetGUIStatement),
		new GUIButton(GUIButtonGroupIndex.InventoryItemList, spr_gui_button_inventory_item, new Vector2(0, 0), new Size(500, 60), undefined, undefined, undefined, undefined, undefined, undefined)
	];
}