/*
	Insert description here
	return:
*/
function GetAllItemMap() {
	var itemMap = ds_map_create();
	itemMap [? sprite_get_name(spr_weapon_sword)] = new Item(spr_weapon_sword, "Sword");
	return itemMap;
}

/*
	Insert description here
	param: _sprite - Insert description here
	return:
*/
function GetItemBySprite(_sprite) {
	var itemMap = GetAllItemMap();
	var spriteName = sprite_get_name(_sprite);
	return ds_map_find_value(itemMap, spriteName)
}