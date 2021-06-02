/*
	Insert description here
	param: _angle - Insert description here
	param: _speed - Insert description here
	return:
*/
function GetGUIStatement() {
	var controller = obj_controller_gui;
	var statement = GUIStatement.Undefined;
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
	var itemSprite = _item.Sprite;
	var xSprOrigin = sprite_get_xoffset(itemSprite);
	var ySprOrigin = sprite_get_yoffset(itemSprite);
	var sprWidth = sprite_get_width(itemSprite);
	var sprHeight = sprite_get_height(itemSprite);
	
	var newXPos = _xSlotPos + floor(_slotWidth / 2) - (floor(sprWidth / 2) - xSprOrigin);
	var newYPos = _ySlotPos + floor(_slotHeight / 2) - (floor(sprHeight / 2) - ySprOrigin);
	
	draw_sprite(itemSprite, 0, newXPos, newYPos);
}