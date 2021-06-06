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
		new Item(spr_weapon_sword, "Sword"),
		new Item(spr_shield_iron, "Iron Shield"),
		new Item(spr_headgear_top_hat, "Top Hat")
	];
}