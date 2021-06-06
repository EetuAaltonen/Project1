/*
	Insert description here
	return: 
*/
function CreateDbFontPresetMap() {
	var fontPresetMap = ds_map_create();
	var allFontPreset = GetDbAllFontPresetArray();
	var arrayLength = array_length(allFontPreset);
	
	for (var i = 0; i < arrayLength; i++) {
		var font = allFontPreset[i];
		fontPresetMap [? font.PresetIndex] = font;
	}
	
	return fontPresetMap;
}

/*
	Insert description here
	param: _key - Insert description here
	return: 
*/
function GetDbFontPresetByIndex(_key) {
	with (obj_controller_database) {
		return ds_map_find_value(dbFontPresetMap, _key);
	}
}

/*
	Insert description here
	return:
*/
function GetDbAllFontPresetArray() {
	return [
		new Font(FontPreset.GeneralSmall, fnt_general_small, c_black, fa_left, fa_center, 1),
		new Font(FontPreset.GeneralMedium, fnt_general_medium, c_black, fa_left, fa_center, 1)
	];
}