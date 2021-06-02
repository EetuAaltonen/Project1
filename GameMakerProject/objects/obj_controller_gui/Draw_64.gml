/// @description Insert description here
var margin = 10;
var sprItemSlot = spr_gui_item_slot;
var slotWidth = sprite_get_width(sprItemSlot);
var slotHeight = sprite_get_height(sprItemSlot);
var viewWidth = view_wport[0];
var viewHeight = view_hport[0];

var xPos = viewWidth / 2;
var yPos = viewHeight - slotHeight - margin;
draw_sprite(sprItemSlot, 0, xPos, yPos);
draw_text(xPos + 8, yPos + 5, "R");

if (!is_undefined(hotbarData.PrimaryItem)) {
	DrawItemOnHotbarSlot(hotbarData.PrimaryItem, xPos, yPos, slotWidth, slotHeight);
}