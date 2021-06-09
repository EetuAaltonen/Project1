/*
	Insert description here
	return:
*/
function EquipInventoryItem(_item) {
	var slotParent = undefined;
	switch (_item.EquipSlot) {
		case EquipSlot.Headgear: { slotParent = obj_player_head; } break;
		case EquipSlot.Primary: { slotParent = obj_player_r_arm; UpdateHotbarPrimaryItem(_item); } break;
		case EquipSlot.Secondary: { slotParent = obj_player_l_arm; } break;
	}
	// Convert to object name
	slotParent = object_get_name(slotParent);
	
	if (!is_undefined(slotParent)) {
		var itemTransform = GetDbObjectTransformByObjectName(_item.ObjectName);
		var player = obj_player;
		
		if (instance_exists(player)) {
			with (player) {
				var parentTransform = transform.GetChildTransformByObjectName(slotParent);
				itemTransform.Parent = parentTransform;
				
				parentTransform.RemoveAllChildTransform();
				parentTransform.AddChild(itemTransform);
				parentTransform.CreateAllChild();
			}
		}
	}
}