/// @description Insert description here
if (!is_undefined(sprite_index) && is_undefined(itemData) && updateItemData) {
	updateItemData = false;
	itemData = GetDbItemDataBySprite(sprite_index);
} else if (!is_undefined(sprite_index) && !is_undefined(itemData)) {
	updateItemData = false;	
}