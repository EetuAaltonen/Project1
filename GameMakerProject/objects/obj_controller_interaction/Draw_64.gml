/// @description Insert description here
// You can write your code in this editor
if (highlightedObject != noone && !is_undefined(interactionMenuValues)
	&& GetGUIStatement() == GUIStatement.ActionMenu) {
	var guiX = 100;
	var guiY = 100;
	var margin = 20;
	
	var listSize = ds_list_size(interactionMenuValues);
	for (var i = 0; i < listSize; i++) {
		var value = ds_list_find_value(interactionMenuValues, i);
		var fontColor = selectedMenuIndex == i ? c_orange : c_white;
		draw_set_color(fontColor);
		draw_text(guiX, guiY + (margin * i), string(value));
	}
}