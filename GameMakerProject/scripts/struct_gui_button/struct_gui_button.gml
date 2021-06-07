/*
	Insert description here
	param: _primaryItem - Insert description here
	param: _secondaryItem - Insert description here
*/
function GUIButton(_index, _buttonGroupIndex, _sprite, _position, _size, _text, _textFont, _tooltip, _value, _isVisible, _hoverFunc, _clickFunc) constructor {
	Index = _index;
	ButtonGroupIndex = _buttonGroupIndex;
	Sprite = _sprite;
	Position = _position;
	Size = _size;
	//Icon = _icon; TODO: GUI button icon
	Text = _text;
	TextFont = _textFont;
	Tooltip = _tooltip;
	Value = _value;
	IsVisible = _isVisible;
	HoverFunc = _hoverFunc;
	ClickFunc = _clickFunc;
	
	static Hovered = function() {
		if (IsVisible && !is_undefined(HoverFunc)) {
			if (IsGUIButtonHovered(self)) {
				script_execute(HoverFunc, Value);
			}
		}	
	}
	
	static Clicked = function() {
		if (IsVisible && !is_undefined(ClickFunc)) {
			var mouseLeftPressed = mouse_check_button_pressed(mb_left);
			if (IsGUIButtonHovered(self) && mouseLeftPressed) {
				switch (ButtonGroupIndex) {
					case GUIButtonGroupIndex.InventoryItemList: {
						script_execute(ClickFunc, Index);
					} break;
					default: {
						script_execute(ClickFunc, Value);
					}
				}
			}
		}
	}
	
	static Draw = function() {
		DrawGUIButton(self);
	}
}