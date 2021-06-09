/*
	Insert description here
	return:
*/
function Transform(_object, _instance, _parent, _transformFunc, _offset, _scale, _rotation, _depth) constructor {
	Object = _object;
	Instance = _instance;
	Parent = _parent;
	TransformFunc = _transformFunc;
	Offset = _offset;
	Scale = _scale;
	Rotation = _rotation;
	Depth = _depth;
	ChildList = ds_list_create();
	
	/*
		Insert description here
	*/
	static AddChild = function(_child) {
		ds_list_add(ChildList, _child);
    }
	
	/*
		Insert description here
	*/
	static CreateAllChild = function() {
		var listSize = ds_list_size(ChildList);
		for (var i = 0; i < listSize; i++) {
			var child = ds_list_find_value(ChildList, i);
			var instance = instance_create_depth(Instance.x, Instance.y, Depth, child.Object);
			child.Instance = instance;
			child.UpdateTransform();
			child.CreateAllChild();
		}
    }
	
	/*
		Insert description here
	*/
	static UpdateTransform = function() {
		if (instance_exists(Instance) && Object != noone && !is_undefined(TransformFunc) && script_exists(TransformFunc)) {
			script_execute(TransformFunc, self);
		}
		var listSize = ds_list_size(ChildList);
		for (var i = 0; i < listSize; i++) {
			var child = ds_list_find_value(ChildList, i);
			child.UpdateTransform();
		}
    }
	
	/*
		Insert description here
		param: _object - Insert description here
	*/
	static GetChildTransformByObject = function(_object) {
		var childTransform = undefined;
		var listSize = ds_list_size(ChildList);
		for (var i = 0; i < listSize; i++) {
			var child = ds_list_find_value(ChildList, i);
			if (child.Object == _object) {
				childTransform = child;
				break;
			} else {
				if (ds_list_size(child.ChildList) > 0) {
					var iterateChild = child.GetChildTransformByObject(_object);
					if (!is_undefined(iterateChild)) {
						childTransform = iterateChild;
						break;
					}
				}
			}
		}
		return childTransform;
    }
	
	/*
		Insert description here
	*/
	static RemoveAllChildTransform = function() {
		var listSize = ds_list_size(ChildList);
		for (var i = 0; i < listSize; i++) {
			var child = ds_list_find_value(ChildList, i);
			child.RemoveAllChildTransform();
			with (child.Instance) {
				instance_destroy();
			}
		}
		ChildList = ds_list_create();
    }
}