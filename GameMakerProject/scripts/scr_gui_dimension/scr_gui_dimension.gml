/*
	Insert description here
	return:
*/
function GetGUISize() {
	var guiWidth = display_get_gui_width();
	var guiHeight = display_get_gui_height();
	return new Size(guiWidth, guiHeight);
}