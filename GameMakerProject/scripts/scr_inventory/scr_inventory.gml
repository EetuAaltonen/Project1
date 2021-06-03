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
function GetInventoryAllItems(_item) {
	var controller = obj_controller_inventory;
	if (instance_exists(controller)) {
		with (controller) {
			return inventory.Items;
		}
	}
}