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
function GetGUIButtonGroupActiveByIndex(_index) {
	var controller = obj_controller_gui;
	if (instance_exists(controller)) {
		with (controller) {
			var listSize = ds_list_size(guiButtonGroups);
			var guiButtonGroup = undefined;
			for (var i = 0; i < listSize; i++) {
				var group = ds_list_find_value(guiButtonGroups, i);
				if (group.Index == _index) {
					guiButtonGroup = group;
					break;
				}
			}
			
			return guiButtonGroup;
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
					break;
				}
			}
		}
	}
}