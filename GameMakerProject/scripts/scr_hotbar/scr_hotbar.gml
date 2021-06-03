/*
	Insert description here
	param: _sprite
	param: _speed - Insert description here
	return:
*/
function DrawItemOnHotbarSlot(_item, _xSlotPos, _ySlotPos, _slotWidth, _slotHeight) {
	var sprCenterMargin = GetSpriteCenterMargin(_item.Sprite);
	var newXPos = _xSlotPos + floor(_slotWidth / 2) + sprCenterMargin.Left;
	var newYPos = _ySlotPos + floor(_slotHeight / 2) + sprCenterMargin.Top;
	
	draw_sprite(_item.Sprite, 0, newXPos, newYPos);
}

/*
	Insert description here
	param: _angle - Insert description here
	param: _speed - Insert description here
	return:
*/
function UpdateHotbarPrimaryItem(_item) {
	var controller = obj_controller_gui;
	if (instance_exists(controller)) {
		with (controller) {
			hotbarData.PrimaryItem = _item;
		}
	}
}