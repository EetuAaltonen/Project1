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
		itemDataMap [? sprite_get_name(itemData.Sprite)] = itemData;
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
	return [
		new Item(spr_weapon_sword, "Sword", EquipSlot.Primary, obj_weapon_sword, TransFuncPlayerLimb, new Vector2(0, 18), new Scale(1, 1), -80, -1),
		new Item(spr_weapon_knife, "Knife", EquipSlot.Primary, obj_weapon_knife, TransFuncPlayerLimb, new Vector2(0, 18), new Scale(1, 1), -80, -1),
		new Item(spr_shield_iron, "Iron Shield", EquipSlot.Secondary, obj_shield_iron, TransFuncPlayerLimb, new Vector2(0, 18), new Scale(1, 1), -90, 1),
		new Item(spr_headgear_top_hat, "Top Hat", EquipSlot.Headgear, obj_headgear_top_hat, TransFuncPlayerLimb, new Vector2(0, -28), new Scale(1, 1), 0, -1),
		new Item(spr_material_iron_bar, "Iron Bar", undefined, undefined, TransFuncPlayerLimb, new Vector2(0, 0), new Scale(1, 1), 0, 1),
		new Item(spr_material_gold_bar, "Gold Bar", undefined, undefined, TransFuncPlayerLimb, new Vector2(0, 0), new Scale(1, 1), 0, 1),
		new Item(spr_material_steel_bar, "Steel Bar", undefined, undefined, TransFuncPlayerLimb, new Vector2(0, 0), new Scale(1, 1), 0, 1)
	];
}