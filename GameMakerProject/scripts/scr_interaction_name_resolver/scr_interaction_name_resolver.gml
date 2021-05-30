/*
	Insert description here
	param:
	return:
*/

function GetInteractionNameListByValueMap(_interactions){
	var map = GetInteractionMap();
	var nameList = ds_list_create();
	var arrayLength = array_length(_interactions);
	
	for (var i = 0; i < arrayLength; i++) {
		for (var key = ds_map_find_first(map); !is_undefined(key); key = ds_map_find_next(map, key)) {
			var value = map[? key];
			if (value == _interactions[i]) {
				ds_list_add(nameList, key);
			}
		}
	}
	return nameList;
}