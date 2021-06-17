/*
	Insert description here
	return:
*/
function CreateDbItemDataMap() {
	var itemDataMap = ds_map_create();
	var allItemData = GetDbAllItemDataArray();
	var arrayLength = array_length(allItemData);
	
	for (var i = 0; i < arrayLength; i++) {
		var itemData = allItemData[i];
		itemData.SpriteName = sprite_get_name(itemData.SpriteName);
		itemData.ObjectName = !is_undefined(itemData.ObjectName) ? object_get_name(itemData.ObjectName) : itemData.ObjectName;
		itemDataMap [? itemData.SpriteName] = itemData;
	}	
	
	return itemDataMap;
}

/*
	Insert description here
	param: _sprite - Insert description here
	return:
*/
function GetDbItemDataBySprite(_sprite) {
	with (obj_controller_database) {
		var spriteName = sprite_get_name(_sprite);
		return ds_map_find_value(dbItemDataMap, spriteName);
	}
}

/*
	Insert description here
	return:
*/
function GetDbAllItemDataArray() {
	// Sprite and object names are mapped afterward
	return [
		// ITEMS
		// Weapons
		new ItemData(spr_weapon_sword, obj_weapon_sword, "Sword", EquipSlot.Primary),
		new ItemData(spr_weapon_knife, obj_weapon_knife, "Knife", EquipSlot.Primary),
		// Shields
		new ItemData(spr_shield_iron, obj_shield_iron, "Iron Shield", EquipSlot.Secondary),
		// Headgears
		new ItemData(spr_headgear_top_hat, obj_headgear_top_hat, "Top Hat", EquipSlot.Headgear),
		// Tools
		new ItemData(spr_tool_iron_pickaxe, obj_tool_iron_pickaxe, "Iron Pickaxe", EquipSlot.Primary),
		// MATERIALS
		// Ores
		new ItemData(spr_material_iron_ore, undefined, "Iron Ore", undefined),
		// Ingots
		new ItemData(spr_material_iron_bar, undefined, "Iron Bar", undefined),
		new ItemData(spr_material_gold_bar, undefined, "Gold Bar", undefined),
		new ItemData(spr_material_steel_bar, undefined, "Steel Bar", undefined)
	];
}