/// @description Insert description here
// You can write your code in this editor
if (highlightedObject != noone && !is_undefined(interactionMenuValues)
	&& GetGUIStatement() == GUIStatement.ActionMenu) {
	var guiPos = new Vector2(100, 100);
	var margin = 20;
	
	SetFontDraw(GetDbFontPresetByIndex(FontPreset.GeneralMedium));
	
	var listSize = ds_list_size(interactionMenuValues);
	for (var i = 0; i < listSize; i++) {
		var interaction = ds_list_find_value(interactionMenuValues, i);
		var fontColor = selectedMenuIndex == i ? c_orange : c_white;
		draw_set_color(fontColor);
		draw_text(guiPos.x, guiPos.y + (margin * i), interaction.Name);
	}
}