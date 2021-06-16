/*
	Insert description here
	return:
*/
function ToggleInventoryItemEquip(_item) {
	var slotParent = undefined;
	switch (_item.EquipSlot) {
		case EquipSlot.Headgear: { slotParent = obj_player_head; } break;
		case EquipSlot.Primary: { slotParent = obj_player_r_arm; } break;
		case EquipSlot.Secondary: { slotParent = obj_player_l_arm; } break;
	}
	// Convert to object name
	slotParent = object_get_name(slotParent);
	
	if (!is_undefined(slotParent)) {
		var isEquipped = false;
		var controller = obj_controller_inventory;
		if (instance_exists(controller)) {
			with (controller) {
				isEquipped = inventory.IsItemEquipped(_item);
				
				if (isEquipped) {
					inventory.UnequipItem(_item);
				} else {
					inventory.EquipItem(_item);
				}
			}
		}
		
		// Update hotbar
		var hotbarItem = isEquipped ? undefined : _item;
		UpdateHotbarItem(hotbarItem, _item.EquipSlot);
		
		var itemTransform = GetDbObjectTransformByObjectName(_item.ObjectName);
		var player = obj_player;
		
		if (instance_exists(player)) {
			with (player) {
				var parentTransform = transform.GetChildTransformByObjectName(slotParent);
				itemTransform.Parent = parentTransform;
				
				parentTransform.RemoveAllChildTransform();
				if (!isEquipped) {
					parentTransform.AddChild(itemTransform);
					parentTransform.CreateAllChild();
				}
			}
		}
	}
}