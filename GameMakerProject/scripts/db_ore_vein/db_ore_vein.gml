/*
	Insert description here
	return:
*/
function CreateDbOreVeinMap() {
	var oreVeinMap = ds_map_create();
	var allOreVein = GetDbAllOreVeinArray();
	var arrayLength = array_length(allOreVein);
	
	for (var i = 0; i < arrayLength; i++) {
		var oreVein = allOreVein[i];
		oreVein.SpriteName = sprite_get_name(oreVein.SpriteName);
		oreVein.OreSpriteName = sprite_get_name(oreVein.OreSpriteName);
		
		oreVeinMap [? oreVein.SpriteName] = oreVein;
	}
	
	return oreVeinMap;
}

/*
	Insert description here
	param: _sprite - Insert description here
	return:
*/
function GetDbOreVeinBySprite(_sprite) {
	with (obj_controller_database) {
		var spriteName = sprite_get_name(_sprite);
		var oreVeinData = ds_map_find_value(dbOreVeinDataMap, spriteName);
		return oreVeinData.Copy();
	}
}

/*
	Insert description here
	return:
*/
function GetDbAllOreVeinArray() {
	// Sprite names are mapped afterward
	return [
		new OreVein(spr_ore_vein_iron, spr_material_iron_ore, 1, spr_tool_iron_pickaxe),
	];
}