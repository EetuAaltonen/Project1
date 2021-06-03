/// @description Insert description here
var guiStatement = GetGUIStatement();

var hotbarFont = GetFontPresetByKey(FontPreset.GeneralSmall);
var inventoryFont = GetFontPresetByKey(FontPreset.GeneralMedium);

var margin = 10;
var sprItemSlot = spr_gui_item_slot;
var slotWidth = sprite_get_width(sprItemSlot);
var slotHeight = sprite_get_height(sprItemSlot);
var guiWidth = display_get_gui_width();
var guiHeight = display_get_gui_height();
var xPos = guiWidth / 2;
var yPos = guiHeight - slotHeight - margin;

SetFontDraw(hotbarFont);
draw_set_valign(fa_top);
draw_set_color(c_white);

draw_sprite(sprItemSlot, 0, xPos, yPos);
draw_text(xPos + 8, yPos + 5, "R");

if (!is_undefined(hotbarData.PrimaryItem)) {
	DrawItemOnHotbarSlot(hotbarData.PrimaryItem, xPos, yPos, slotWidth, slotHeight);
}

switch (guiStatement) {
	case GUIStatement.Inventory: {
		var bgSprite = spr_gui_inventory_bg;
		var spriteSize = sprite_get_width(bgSprite);
		var margin = new Margin(30, 50, 30, 100);
		var bgXScale = (guiWidth - margin.Left - margin.Right) / spriteSize;
		var bgYScale = (guiHeight - margin.Top - margin.Bottom) / spriteSize;
		var bgAlpha = 0.8;
		draw_sprite_ext(
			bgSprite, 0,
			margin.Left, margin.Top, bgXScale, bgYScale,
			0, c_white, bgAlpha
		);
		
		// Render items
		if (!is_undefined(inventoryRenderData)) {
			SetFontDraw(inventoryFont);
			var listSize = ds_list_size(inventoryRenderData);
			for (var i = 0; i < listSize; i++) {
				var item = ds_list_find_value(inventoryRenderData, i);
				var vMargin = 60;
				var sprOffset = new Vector2(100, 100);
				var sprCenterMargin = GetSpriteCenterMargin(item.Sprite);
				var textOffset = new Vector2(150, 100);
				draw_sprite(
					item.Sprite, 0,
					sprOffset.x + sprCenterMargin.Left,
					sprOffset.y + (vMargin * i) + sprCenterMargin.Top
				);
				draw_text(textOffset.x, textOffset.y + (vMargin * i), item.Name);
			}
		}
	} break;
}