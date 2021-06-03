/*
	Insert description here
	param: _x - Insert description here
	param: _y - Insert description here
*/
function Inventory() constructor {
	Items = ds_list_create();
	static AddItem = function(_item) {
		if (!is_undefined(_item)) {
			ds_list_add(Items, _item);
		}
	}
}