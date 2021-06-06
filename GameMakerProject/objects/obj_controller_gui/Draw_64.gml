/// @description Insert description here
var guiStatement = GetGUIStatement();

var hotbarFont = GetDbFontPresetByIndex(FontPreset.GeneralSmall);
var inventoryFont = GetDbFontPresetByIndex(FontPreset.GeneralMedium);

var margin = 10;
var sprItemSlot = spr_gui_item_slot;
var slotSize = GetSpriteSize(sprItemSlot);
var guiSize = GetGUISize();
var xPos = guiSize.Width / 2;
var yPos = guiSize.Height - slotSize.Height - margin;

SetFontDraw(hotbarFont);
draw_set_valign(fa_top);
draw_set_color(c_white);

draw_sprite(sprItemSlot, 0, xPos, yPos);
draw_text(xPos + 8, yPos + 5, "R");

if (!is_undefined(hotbarData.PrimaryItem)) {
	DrawItemOnHotbarSlot(hotbarData.PrimaryItem, xPos, yPos, slotSize.Width, slotSize.Height);
}

switch (guiStatement) {
	case GUIStatement.Inventory: {
		var bgSprite = spr_gui_inventory_bg;
		var margin = new Margin(30, 50, 30, 100);
		var bgSize = new Size (
			(guiSize.Width - margin.Left - margin.Right),
			(guiSize.Height - margin.Top - margin.Bottom)
		);
		var bgSpriteScale = StrechSpriteNineSliceScale(bgSprite, bgSize);
		var bgAlpha = 0.8;
		draw_sprite_ext(
			bgSprite, 0,
			margin.Left, margin.Top, bgSpriteScale.Horizontal, bgSpriteScale.Vertical,
			0, c_white, bgAlpha
		);
		
		// Render items
		if (!is_undefined(inventoryRenderData)) {
			SetFontDraw(inventoryFont);
			var listSize = ds_list_size(inventoryRenderData);
			for (var i = 0; i < listSize; i++) {
				var itemData = ds_list_find_value(inventoryRenderData, i);
				var vMargin = 60;
				var sprOffset = new Vector2(100, 100);
				var sprCenterMargin = GetSpriteCenterMargin(itemData.Sprite);
				var textOffset = new Vector2(150, 100);
				draw_sprite(
					itemData.Sprite, 0,
					sprOffset.x + sprCenterMargin.Left,
					sprOffset.y + (vMargin * i) + sprCenterMargin.Top
				);
				draw_text(textOffset.x, textOffset.y + (vMargin * i), itemData.Name);
			}
		}
	} break;
}

var listSize = ds_list_size(guiButtonGroups);
for (var i = 0; i < listSize; i++) {
	var guiButtonGroup = ds_list_find_value(guiButtonGroups, i);
	var groupSize = ds_list_size(guiButtonGroup.Buttons);
	for (var j = 0; j < groupSize; j++) {
		var guiButton = ds_list_find_value(guiButtonGroup.Buttons, j);
		guiButton.Hovered();
		guiButton.Clicked();
		guiButton.Draw();
	}
}