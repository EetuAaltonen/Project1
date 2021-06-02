/// @description Insert description here
var margin = 10;
var sprItemSlot = spr_gui_item_slot;
var slotWidth = sprite_get_width(sprItemSlot);
var slotHeight = sprite_get_height(sprItemSlot);
var guiWidth = display_get_gui_width();
var guiHeight = display_get_gui_height();

var xPos = guiWidth / 2;
var yPos = guiHeight - slotHeight - margin;
draw_sprite(sprItemSlot, 0, xPos, yPos);
draw_text(xPos + 8, yPos + 5, "R");

if (!is_undefined(hotbarData.PrimaryItem)) {
	DrawItemOnHotbarSlot(hotbarData.PrimaryItem, xPos, yPos, slotWidth, slotHeight);
}

/// @description Insert description here
if (GetGUIStatement() == GUIStatement.Inventory) {
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
}