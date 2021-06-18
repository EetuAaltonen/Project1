/// @description Insert description here
var guiStatement = GetGUIStatement();

var margin = 10;
var sprItemSlot = spr_gui_item_slot;
var slotSize = GetSpriteSize(sprItemSlot);
var guiSize = GetGUISize();
var xPos = guiSize.Width / 2;
var yPos = guiSize.Height - slotSize.Height - margin;

SetFontDraw(hotbarFont);
draw_set_valign(fa_top);
draw_set_color(c_white);

// Primary slot
draw_sprite(sprItemSlot, 0, xPos, yPos);
draw_text(xPos + 8, yPos + 5, "R");
if (!is_undefined(hotbarData.PrimaryItem)) {
	DrawItemSpriteOnHotbarSlot(hotbarData.PrimaryItem.SpriteName, xPos, yPos, slotSize.Width, slotSize.Height);
}

// Secondary slot
xPos += 68;
draw_sprite(sprItemSlot, 0, xPos, yPos);
draw_text(xPos + 8, yPos + 5, "L");
if (!is_undefined(hotbarData.SecondaryItem)) {
	DrawItemSpriteOnHotbarSlot(hotbarData.SecondaryItem.SpriteName, xPos, yPos, slotSize.Width, slotSize.Height);
}

if (!is_undefined(guiStatement)) {
	if (guiStatement == GUIStatement.Inventory ||
		guiStatement == GUIStatement.Shop) {
		// Inventory background
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
		// Page index
		draw_text(margin.Left + 10, margin.Top + 10, "Page: " + string(min(itemListPageCount, itemListPageIndex + 1)) + " / " + string(itemListPageCount));	
	}
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