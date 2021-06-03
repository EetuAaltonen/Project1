/*
	Insert description here
	param: _primaryItem - Insert description here
	param: _secondaryItem - Insert description here
*/
function GUIButton(_position, _size, _sprite, _value, _hoverFunc, _clickFunc) constructor {
	Position = _position;
	Size = _size;
	Sprite = _sprite;
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