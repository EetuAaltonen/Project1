/*
	Insert description here
	param: _primaryItem - Insert description here
	param: _secondaryItem - Insert description here
*/
function GUIButton(_sprite, _position, _size, _text, _textFont, _tooltip, _value, _hoverFunc, _clickFunc) constructor {
	Sprite = _sprite;
	Position = _position;
	Size = _size;
	//Icon = _icon; TODO: GUI button icon
	Text = _text;
	TextFont = _textFont;
	Tooltip = _tooltip;
	Value = _value;
	HoverFunc = _hoverFunc;
	ClickFunc = _clickFunc;
	
	static Hovered = function() {
		if (!is_undefined(HoverFunc)) {
			if (IsGUIButtonHovered(self)) {
				script_execute(HoverFunc, Value);
			}
		}	
	}
	
	static Clicked = function() {
		if (!is_undefined(ClickFunc)) {
			var mouseLeftPressed = mouse_check_button_pressed(mb_left);
			if (IsGUIButtonHovered(self) && mouseLeftPressed) {
				script_execute(ClickFunc, Value);
			}
		}
	}
	
	static Draw = function() {
		DrawGUIButton(self);
	}
}