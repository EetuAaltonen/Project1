/// @description Insert description here
guiStatement = undefined;
hotbarData = new HotbarData(undefined, undefined);
guiButtonGroups = ds_list_create();

// Inventory
inventoryRenderData = undefined;
inventoryRefresh = false;
inventoryPageIndex = 0;
inventoryPageCount = 1;
inventoryLastIndex = 0;

// Fonts
hotbarFont = GetDbFontPresetByIndex(FontPreset.GeneralSmall);