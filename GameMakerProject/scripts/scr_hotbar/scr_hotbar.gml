/*
	Insert description here
	param: _sprite
	param: _speed - Insert description here
	return:
*/
function DrawItemSpriteOnHotbarSlot(_spriteName, _xSlotPos, _ySlotPos, _slotWidth, _slotHeight) {
	var itemSprite = asset_get_index(_spriteName);
	var sprCenterMargin = GetSpriteCenterMargin(itemSprite);
	var newXPos = _xSlotPos + floor(_slotWidth / 2) + sprCenterMargin.Left;
	var newYPos = _ySlotPos + floor(_slotHeight / 2) + sprCenterMargin.Top;
	
	draw_sprite(itemSprite, 0, newXPos, newYPos);
}

/*
	Insert description here
	param: _item - Insert description here
	param: _equipSlot - Insert description here
	return:
*/
function UpdateHotbarItem(_item, _equipSlot) {
	var controller = obj_controller_gui;
	if (instance_exists(controller)) {
		with (controller) {
			switch (_equipSlot) {
				case EquipSlot.Primary: { hotbarData.PrimaryItem = _item; } break;
				case EquipSlot.Secondary: { hotbarData.SecondaryItem = _item; } break;
			}
		}
	}
}