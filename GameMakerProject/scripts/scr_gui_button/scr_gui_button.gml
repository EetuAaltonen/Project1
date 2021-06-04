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

/*
	Insert description here
	param: _angle - Insert description here
	param: _speed - Insert description here
	return:
*/
function DrawGUIButton(_button) {
	var sprScale = StrechSpriteNineSliceScale(_button.Sprite, _button.Size);
	draw_sprite_ext(
		_button.Sprite, 0,
		_button.Position.x, _button.Position.y,
		sprScale.Horizontal, sprScale.Vertical,
		0, c_white, 1
	);
	SetFontDraw(_button.TextFont);
	draw_set_halign(fa_center);
	if (!is_undefined(_button.Text)) {
		var textPos = new Vector2(
			_button.Position.x + (_button.Size.Width / 2),
			_button.Position.y + (_button.Size.Height / 2)
		);
		draw_text(textPos.x, textPos.y, _button.Text);
	}
}