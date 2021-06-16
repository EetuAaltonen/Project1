/*
	Insert description here
	param: _x - Insert description here
	param: _y - Insert description here
*/
function Inventory() constructor {
	Items = ds_list_create();
	EquipList = ds_list_create();
	
	/*
		Insert description here
		param: _item - Insert description here
	*/
	static AddItem = function(_item) {
		if (!is_undefined(_item)) {
			ds_list_add(Items, _item);
		}
	}
	
	/*
		Insert description here
		param: _item - Insert description here
	*/
	static EquipItem = function(_item) {
		if (!is_undefined(_item)) {
			// Replace item in the same equipslot
			var listSize = ds_list_size(EquipList);
			for (var i = 0; i < listSize; i++) {
				var equipment =	ds_list_find_value(EquipList, i);
				if (equipment.EquipSlot = _item.EquipSlot) {
					ds_list_delete(EquipList, i);
					break;
				}
			}
			// Add new equipped item
			ds_list_add(EquipList, _item);
		}
	}
	
	/*
		Insert description here
		param: _item - Insert description here
	*/
	static UnequipItem = function(_item) {
		if (!is_undefined(_item)) {
			var listSize = ds_list_size(EquipList);
			for (var i = 0; i < listSize; i++) {
				var equipment =	ds_list_find_value(EquipList, i);
				// TODO: Better item comparing
				if (equipment.SpriteName = _item.SpriteName) {
					ds_list_delete(EquipList, i);
					break;
				}
			}
		}
	}
	
	/*
		Insert description here
		param: _item - Insert description here
	*/
	static IsItemEquipped = function(_item) {
		var isEqupped = false;
		
		if (!is_undefined(_item)) {
			var listSize = ds_list_size(EquipList);
			for (var i = 0; i < listSize; i++) {
				var equipment =	ds_list_find_value(EquipList, i);
				// TODO: Better item comparing
				if (equipment.SpriteName = _item.SpriteName) {
					isEqupped = true;
					break;
				}
			}
		}
		
		return isEqupped;
	}
}