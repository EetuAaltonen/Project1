/*
	Insert description here
	param: _item - Insert description here
	param: _spawnPosition - Insert description here
	param: _enableGravity - Insert description here
*/
function SpawnCollectableItem(_item, _spawnPosition, _enableGravity){
	var instance = instance_create_layer(
		_spawnPosition.x, _spawnPosition.y,
		layer_get_id("Collectable"), obj_collectable_item
	);
	instance.itemData = _item;
	instance.sprite_index = asset_get_index(_item.SpriteName);
	instance.enableGravity = _enableGravity;
}