/*
	Insert description here
	return:
*/
function GetAllItemMap() {
	var itemMap = ds_map_create();
	
	itemMap [? sprite_get_name(spr_weapon_sword)] = new Item(spr_weapon_sword, "Sword");
	itemMap [? sprite_get_name(spr_shield_iron)] = new Item(spr_shield_iron, "Iron Shield");
	itemMap [? sprite_get_name(spr_headgear_top_hat)] = new Item(spr_headgear_top_hat, "Top Hat");
	
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