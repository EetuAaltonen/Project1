/*
	Insert description here
	return: 
*/
function GetFontPresetMap() {
	var  map = ds_map_create();
	map [? FontPreset.GeneralSmall] = new Font(fnt_general_small, c_black, fa_left, fa_center, 1);
	map [? FontPreset.GeneralMedium] = new Font(fnt_general_medium, c_black, fa_left, fa_center, 1);
	
	return map;
}

/*
	Insert description here
	param: _key - Insert description here
	return: 
*/
function GetFontPresetByKey(_key) {
	var map = GetFontPresetMap();
	return ds_map_find_value(map, _key);
}

/*
	Insert description here
	param: _font - Insert description here
*/
function SetFontDraw(_font) {
	if (!is_undefined(_font)) {
		draw_set_font(_font.Style);
		draw_set_color(_font.Color);
		draw_set_halign(_font.HorizontalAlign);
		draw_set_valign(_font.VerticalAlign);
		draw_set_alpha(_font.Alpha);
	}
}