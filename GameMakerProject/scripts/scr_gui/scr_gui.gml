/*
	Insert description here
	param: _angle - Insert description here
	param: _speed - Insert description here
	return:
*/
function GetGUIStatement() {
	var controller = obj_controller_gui;
	var statement = undefined;
	if (instance_exists(controller)) {
		with (controller) {
			statement = guiStatement;	
		}
	}
	return statement;
}

/*
	Insert description here
	param: _angle - Insert description here
	param: _speed - Insert description here
	return:
*/
function SetGUIStatement(_statement) {
	var controller = obj_controller_gui;
	if (instance_exists(controller)) {
		with (controller) {
			guiStatement = _statement;
		}
	}
}

/*
	Insert description here
	param: _angle - Insert description here
	param: _speed - Insert description here
	return:
*/
function ResetGUIStatement() {
	var controller = obj_controller_gui;
	if (controller != self) {
		if (instance_exists(controller)) {
			with (controller) {
				guiStatement = undefined;
			}
		}
	}
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
	param: _sprite
	param: _speed - Insert description here
	return:
*/
function GetSpriteCenterMargin(_sprite) {
	var xSprOrigin = sprite_get_xoffset(_sprite);
	var ySprOrigin = sprite_get_yoffset(_sprite);
	var sprWidth = sprite_get_width(_sprite);
	var sprHeight = sprite_get_height(_sprite);
	
	var leftMargin = -(floor(sprWidth / 2) - xSprOrigin);
	var topMargin = -(floor(sprHeight / 2) - ySprOrigin);
	
	return new Margin(leftMargin, topMargin, 0, 0);
}