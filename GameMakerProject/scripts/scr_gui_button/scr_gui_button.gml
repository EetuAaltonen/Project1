/*
	Insert description here
	param: _button - Insert description here
	return:
*/
function IsGUIButtonHovered(_button) {
	var mousePos = GetGUIMousePos();
	return point_in_rectangle(
		mousePos.x, mousePos.y,
		_button.Position.x, _button.Position.y,
		_button.Position.x + _button.Size.Width,
		_button.Position.y + _button.Size.Height
	);
}