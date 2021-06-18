/// @description Insert description here
var inventoryKeyNextPage = keyboard_check_released(ord("D"));
var inventoryKeyPrevPage = keyboard_check_released(ord("A"));
var inventoryKey = keyboard_check_released(vk_tab);
var escKey = keyboard_check_released(vk_escape);

if (is_undefined(guiStatement)) {
	if (inventoryKey) {
		RequestGUIStatementSet(GUIStatement.Inventory);
		itemListRenderData = GetInventoryAllItems();
	}
} else {
	if (guiStatement == GUIStatement.Inventory ||
		guiStatement == GUIStatement.Shop) {
		if (inventoryKey || escKey) {
			RequestGUIStatementReset();
		} else {
			if (!is_undefined(itemListRenderData)) {
				var guiButtonGroup;
				if (guiStatement == GUIStatement.Inventory) {
					guiButtonGroup = GetGUIButtonGroupActiveByIndex(GUIButtonGroupIndex.InventoryItemList);
				} else if (guiStatement == GUIStatement.Shop) {
					guiButtonGroup = GetGUIButtonGroupActiveByIndex(GUIButtonGroupIndex.ShopItemList);
				}
				var itemsPerPage = ds_list_size(guiButtonGroup.Buttons);
					
				// Page change
				itemListPageCount = ceil(itemListRenderDataSize / itemsPerPage);
				if (itemListPageCount > 0) {
					if (inventoryKeyNextPage) {
						itemListPageIndex = ++itemListPageIndex > (itemListPageCount - 1) ? 0 : itemListPageIndex;
						itemListRefresh = true;
					} else if (inventoryKeyPrevPage) {
						itemListPageIndex = --itemListPageIndex < 0 ? (itemListPageCount - 1) : itemListPageIndex;
						itemListRefresh = true;
					}
					
					if (itemListRefresh) {
						itemListRefresh = false;
						itemListRenderDataSize = ds_list_size(itemListRenderData);
						itemListLastIndex = min(itemsPerPage, (itemListRenderDataSize - (itemListPageIndex * itemsPerPage)));

						// Update item list values
						var vMargin = 61;
						for (var i = 0; i < itemsPerPage; i++) {
							var guiButton =	ds_list_find_value(guiButtonGroup.Buttons, i);
							var isBeforeLastIndex = i < itemListLastIndex;
							var itemIndex = i + (itemListPageIndex * itemsPerPage);
							var itemData = isBeforeLastIndex ? ds_list_find_value(itemListRenderData, itemIndex) : undefined;
							
							guiButton.Index = itemIndex;
							guiButton.Position = new Vector2(60, 130 + (i * vMargin));
							guiButton.Value = itemData;
							guiButton.IsVisible = isBeforeLastIndex;
							guiButton.ClickFunc = isBeforeLastIndex ? ClickedButtonFuncInventoryItem : undefined;
						}
					}
				}
			}
		}
	}
}

