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
				if (buttonGroup.Index == GUIButtonGroupIndex.InventoryItemList ||
					buttonGroup.Index == GUIButtonGroupIndex.ShopItemList) {
					var itemsPerPage = 8;
					for (var k = 0; k < itemsPerPage; k++) {
						buttonGroup.AddGUIButton(new GUIButton(
							button.Index, button.ButtonGroupIndex,
							button.Sprite, button.Position, button.Size,
							button.Text, button.TextFont,
							button.Tooltip, button.Value,
							button.IsVisible, button.HoverFunc, button.ClickFunc
						));
					}
				} else {
					buttonGroup.AddGUIButton(button);
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
		// INVENTORY
		new GUIButtonGroup(GUIButtonGroupIndex.InventoryControls),
		new GUIButtonGroup(GUIButtonGroupIndex.InventoryItemList),
		// SHOP
		new GUIButtonGroup(GUIButtonGroupIndex.ShopControls),
		new GUIButtonGroup(GUIButtonGroupIndex.ShopItemList)
	];
}

/*
	Insert description here
	return:
*/
function GetDbAllGUIButtonArray() {
	return [
		// INVENTORY
		new GUIButton(0, GUIButtonGroupIndex.InventoryControls, spr_gui_button_inventory, new Vector2(1220, 70), new Size(100, 40), "Close", GetDbFontPresetByIndex(FontPreset.GeneralMedium), undefined, "TestButton", true, undefined, ButtonFuncResetGUIStatement),
		new GUIButton(0, GUIButtonGroupIndex.InventoryItemList, spr_gui_button_inventory_item, new Vector2(0, 0), new Size(500, 60), undefined, GetDbFontPresetByIndex(FontPreset.GeneralMedium), undefined, undefined, false, undefined, undefined),
		// SHOP
		new GUIButton(0, GUIButtonGroupIndex.ShopControls, spr_gui_button_inventory, new Vector2(1220, 70), new Size(100, 40), "Close", GetDbFontPresetByIndex(FontPreset.GeneralMedium), undefined, "TestButtonShop", true, undefined, ButtonFuncResetGUIStatement),
		new GUIButton(0, GUIButtonGroupIndex.ShopItemList, spr_gui_button_inventory_item, new Vector2(0, 0), new Size(500, 60), undefined, GetDbFontPresetByIndex(FontPreset.GeneralMedium), undefined, undefined, false, undefined, undefined)
	];
}