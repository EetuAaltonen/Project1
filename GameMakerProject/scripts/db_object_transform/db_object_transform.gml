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
		objectTransform.ObjectName = object_get_name(objectTransform.ObjectName);
		objectTransformMap [? objectTransform.ObjectName] = objectTransform;
	}	
	
	return objectTransformMap;
}

/*
	Insert description here
	param: _objectName - Insert description here
	return:
*/
function GetDbObjectTransformByObjectName(_objectName) {
	with (obj_controller_database) {
		var objectTransform = ds_map_find_value(dbObjectTransformMap, _objectName);
		return new Transform(
			objectTransform.ObjectName, objectTransform.Instance,
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
	// Object names are mapped afterward
	return [
		new Transform(obj_weapon_sword, undefined, undefined, TransFuncPlayerLimb, new Vector2(0, 18), new Scale(1, 1), -80, -1),
		new Transform(obj_weapon_knife, undefined, undefined, TransFuncPlayerLimb, new Vector2(0, 18), new Scale(1, 1), -80, -1),
		new Transform(obj_shield_iron, undefined, undefined, TransFuncPlayerLimb, new Vector2(0, 18), new Scale(1, 1), -90, 1),
		new Transform(obj_headgear_top_hat, undefined, undefined, TransFuncPlayerLimb, new Vector2(0, -28), new Scale(1, 1), 0, -1)
	];
}