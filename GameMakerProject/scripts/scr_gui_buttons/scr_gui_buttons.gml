/*
	Insert description here
	param: _angle - Insert description here
	param: _speed - Insert description here
	return:
*/
function GetGUIMousePos() {
	var mouseX = device_mouse_x_to_gui(0);
	var mouseY = device_mouse_y_to_gui(0);
	return new Vector2(mouseX, mouseY);
}

/*
	Insert description here
	param: _angle - Insert description here
	param: _speed - Insert description here
	return:
*/
function IsGUIButtonHovered(_buttonPos, _buttonSize) {
	var mousePos = GetGUIMousePos();
	return point_in_rectangle(
		mousePos.x, mousePos.y,
		_buttonPos.x, _buttonPos.y,
		_buttonPos.x + _buttonSize.Width,
		_buttonPos.y + _buttonSize.Height
	);
}

/*
	Insert description here
	param: _angle - Insert description here
	param: _speed - Insert description here
	return:
*/
function DrawGUIButton(_button) {
	StrechSpriteNineSliceScale(bgSprite, bgSize);
}