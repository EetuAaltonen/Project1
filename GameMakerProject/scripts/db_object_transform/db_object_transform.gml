/*
	Insert description here
	return:
*/
function CreateDbObjectTransformMap() {
	var objectTransformMap = ds_map_create();
	var allObjectTransform = GetDbAllObjectTransformArray();
	var arrayLength = array_length(allObjectTransform);
	
	for (var i = 0; i < arrayLength; i++) {
		var objectTransform = allObjectTransform[i];
		objectTransformMap [? object_get_name(objectTransform.Object)] = objectTransform;
	}	
	
	return objectTransformMap;
}

/*
	Insert description here
	param: _object - Insert description here
	return:
*/
function GetDbObjectTransformByObject(_object) {
	with (obj_controller_database) {
		var objectName = object_get_name(_object);
		var objectTransform = ds_map_find_value(dbObjectTransformMap, objectName);
		return new Transform(
			objectTransform.Object, objectTransform.Instance,
			objectTransform.Parent, objectTransform.TransformFunc,
			objectTransform.Offset, objectTransform.Scale,
			objectTransform.Rotation, objectTransform.Depth
		);
	}
}

/*
	Insert description here
	return:
*/
function GetDbAllObjectTransformArray() {
	return [
		new Transform(obj_weapon_sword, undefined, undefined, TransFuncPlayerLimb, new Vector2(0, 18), new Scale(1, 1), -80, -1),
		new Transform(obj_weapon_knife, undefined, undefined, TransFuncPlayerLimb, new Vector2(0, 18), new Scale(1, 1), -80, -1),
		new Transform(obj_shield_iron, undefined, undefined, TransFuncPlayerLimb, new Vector2(0, 18), new Scale(1, 1), -90, 1),
		new Transform(obj_headgear_top_hat, undefined, undefined, TransFuncPlayerLimb, new Vector2(0, -28), new Scale(1, 1), 0, -1)
	];
}