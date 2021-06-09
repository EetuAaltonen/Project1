/*
	Insert description here
	param: _angle - Insert description here
	param: _speed - Insert description here
	return:
*/
function DrawGUIButton(_button) {
	if (_button.IsVisible) {
		var sprScale = StrechSpriteNineSliceScale(_button.Sprite, _button.Size);
		draw_sprite_ext(
			_button.Sprite, 0,
			_button.Position.x, _button.Position.y,
			sprScale.Horizontal, sprScale.Vertical,
			0, c_white, 1
		);
		
		switch (_button.ButtonGroupIndex) {
			case GUIButtonGroupIndex.InventoryItemList: {
				// Render item
				DrawGUIButtonInventoryItem(_button);
			} break;
			default: {
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
		}
	}
}

/*
	Insert description here
	param: _button - Insert description here
	return:
*/
function DrawGUIButtonInventoryItem(_button) {
	if (!is_undefined(_button.Value)) {			
		var itemData = _button.Value;
		var itemSprite = asset_get_index(itemData.SpriteName);
		var sprOffset = new Vector2(50, 0);
		var sprCenterMargin = GetSpriteCenterMargin(itemSprite);
		var textOffset = new Vector2(120, 0);
		
		SetFontDraw(_button.TextFont);
		if (IsGUIButtonHovered(_button)) { draw_set_color(c_white); }
		draw_sprite(
			itemSprite, 0,
			_button.Position.x + sprOffset.x + sprCenterMargin.Left,
			_button.Position.y + (_button.Size.Height / 2) + sprCenterMargin.Top
		);
		draw_text(_button.Position.x + textOffset.x, _button.Position.y + (_button.Size.Height / 2), itemData.Name);
	}
}