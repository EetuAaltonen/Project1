/*
	Insert description here
	return:
*/
function GetAllGUIButtonGroupMap() {
	var buttonGroupMap = ds_map_create();
	
	var inventoryControls = new GUIButtonGroup(GUIButtonGroupIndex.InventoryControls);
		inventoryControls.AddGUIButton(new GUIButton(
			spr_gui_inventory_bg, new Vector2(800, 100), new Size(100, 40),
			"Close", GetFontPresetByKey(FontPreset.GeneralMedium), undefined, "TestButton",
			undefined, ButtonFuncResetGUIStatement
		));
	buttonGroupMap [? inventoryControls.Index] = inventoryControls;
	
	return buttonGroupMap;
}

/*
	Insert description here
	return:
*/
function GetGUIButtonGroupByIndex(_index) {
	var buttonGroupMap = GetAllGUIButtonGroupMap();
	return ds_map_find_value(buttonGroupMap, _index);
}

/*
	Insert description here
	return:
*/
function AddGUIButtonGroupActive(_guiButtonGroup) {
	var controller = obj_controller_gui;
	if (instance_exists(controller)) {
		with (controller) {
			ds_list_add(guiButtonGroups, _guiButtonGroup);	
		}
	}
}

/*
	Insert description here
	return:
*/
function RemoveGUIButtonGroupActiveByIndex(_index) {
	var controller = obj_controller_gui;
	if (instance_exists(controller)) {
		with (controller) {
			var listSize = ds_list_size(guiButtonGroups);
			for (var i = 0; i < listSize; i++) {
				var buttonGroup = ds_list_find_value(guiButtonGroups, i);
				if (buttonGroup.Index == _index) {
					ds_list_delete(guiButtonGroups, i);	
				}
			}	
		}
	}	
}