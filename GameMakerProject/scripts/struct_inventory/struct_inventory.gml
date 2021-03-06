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
		param: _count - Insert description here
	*/
	static AddItem = function(_item, _count) {
		if (!is_undefined(_item)) {
			var listSize = ds_list_size(Items);
			var existsItem = false;
			for (var i = 0; i < listSize; i++) {
				var item = ds_list_find_value(Items, i);
				if (CompareItemData(item, _item)) {
					var playerPosition = GetPlayerPosition();
					if (!is_undefined(playerPosition)) {
						existsItem = true;
						var dropPosition = new Vector2(playerPosition.x, playerPosition.y - 20);
						var newCount = item.Count + _count;
						var droppedItem = item.Copy();
						
						// Drop item
						if (_count < 0) {
							droppedItem.Count = abs(_count);
							SpawnCollectableItem(droppedItem, dropPosition, true);
						}
						
						// Update new count
						if (newCount <= 0) {
							if (IsItemEquipped(item)) {
								ToggleInventoryItemEquip(item);
							}
							ds_list_delete(Items, i);
							RequestInventoryItemListUpdate();
						} else {
							item.Count = newCount;
						}
					}
					break;
				}
			}
			if (!existsItem) {
				ds_list_add(Items, _item);	
			}
		}
	}
	
	/*
		Insert description here
		param: _item - Insert description here
	*/
	static EquipItem = function(_item) {
		if (!is_undefined(_item)) {
			// Replace item in the same equipmentSlot
			var listSize = ds_list_size(EquipList);
			for (var i = 0; i < listSize; i++) {
				var equipment =	ds_list_find_value(EquipList, i);
				if (equipment.EquipmentSlot = _item.EquipmentSlot) {
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
				if (CompareItemData(equipment, _item)) {
					ds_list_delete(EquipList, i);
					break;
				}
			}
		}
	}
	
	/*
		Insert description here
		param: _equipmentSlot - Insert description here
	*/
	static GetEquipmentByEquipmentSlot = function(_equipmentSlot) {
		var equipment = undefined;
		
		if (!is_undefined(_equipmentSlot)) {
			var listSize = ds_list_size(EquipList);
			for (var i = 0; i < listSize; i++) {
				var equippedItem = ds_list_find_value(EquipList, i);
				if (equippedItem.EquipmentSlot = _equipmentSlot) {
					equipment = equippedItem.Copy();
				}
			}
		}
		
		return equipment;
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
				if (CompareItemData(equipment, _item)) {
					isEqupped = true;
					break;
				}
			}
		}
		
		return isEqupped;
	}
}