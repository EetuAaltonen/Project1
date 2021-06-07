/// @description Insert description here
var mousePos = GetGUIMousePos();
var posString = string(mousePos.x) + ", " + string(mousePos.y);
var guiSize = GetGUISize();

SetFontDraw(debugFont);
var yDir = mousePos.y > (guiSize.Height / 2) ? -1 : 1;
if (mousePos.x > (guiSize.Width / 2)) {
	draw_set_halign(fa_right);
} else {
	draw_set_halign(fa_left);	
}
draw_text(mousePos.x, mousePos.y + (20 * yDir), posString);