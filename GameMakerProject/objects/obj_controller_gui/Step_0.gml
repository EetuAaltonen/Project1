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
	switch (guiStatement) {
		case GUIStatement.Inventory: {
			if (inventoryKey || escKey) {
				RequestGUIStatementReset();
			} else {
				if (!is_undefined(inventoryRenderData)) {
					if (inventoryRefresh) {
						inventoryRefresh = false;
						var renderDataSize = ds_list_size(inventoryRenderData);
						var vMargin = 59;
						var guiButtonGroup = GetGUIButtonGroupActiveByIndex(GUIButtonGroupIndex.InventoryItemList);
						var itemsPerPage = ds_list_size(guiButtonGroup.Buttons);
						inventoryLastIndex = min(itemsPerPage, (renderDataSize - (inventoryPageIndex * itemsPerPage)));
						for (var i = 0; i < itemsPerPage; i++) {
							var guiButton =	ds_list_find_value(guiButtonGroup.Buttons, i);
							var isBeforeLastIndex = i < inventoryLastIndex;
							var itemIndex = i + (inventoryPageIndex * itemsPerPage);
							var itemData = isBeforeLastIndex ? ds_list_find_value(inventoryRenderData, itemIndex) : undefined;
							
							guiButton.Index = itemIndex;
							guiButton.Position = new Vector2(60, 70 + (i * vMargin));
							guiButton.Value = itemData;
							guiButton.IsVisible = isBeforeLastIndex;
							guiButton.ClickFunc = isBeforeLastIndex ? ClickedButtonFuncInventoryItem : undefined;
						}
					}
				}
			}
		} break;
	}
}

