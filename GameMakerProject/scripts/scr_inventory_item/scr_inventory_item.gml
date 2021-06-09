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
	
	if (!is_undefined(slotParent)) {
		var player = obj_player;
		if (instance_exists(player)) {
			with (player) {
				var parentTransform = transform.GetChildTransformByObject(slotParent);
				parentTransform.RemoveAllChildTransform();
				parentTransform.AddChild(new Transform(
					_item.InstanceObject, undefined, parentTransform,
					_item.InstanceTransFunc, _item.InstanceOffset, _item.InstanceScale,
					_item.InstanceRotation, _item.InstanceDepth));
				parentTransform.CreateAllChild();
			}
		}
	}
}