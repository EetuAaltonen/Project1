/*
	Insert description here
	return:
*/
function AddInventoryItem(_item) {
	var controller = obj_controller_inventory;
	if (instance_exists(controller)) {
		with (controller) {
			inventory.AddItem(_item);
		}
	}
}

/*
	Insert description here
	return:
*/
function GetInventoryAllItems() {
	var controller = obj_controller_inventory;
	if (instance_exists(controller)) {
		with (controller) {
			return inventory.Items;
		}
	}
}

/*
	Insert description here
	return:
*/
function GetInventoryItemByIndex(_index) {
	var controller = obj_controller_inventory;
	if (instance_exists(controller)) {
		with (controller) {
			return ds_list_find_value(controller.inventory.Items, _index);
		}
	}
}