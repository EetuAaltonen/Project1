/*
	Insert description here
	return:
*/
function Transform(_object, _instance, _parent, _transformFunc, _xOffset, _yOffset, _rotation, _depth) constructor {
	Object = _object;
	Instance = _instance;
	Parent = _parent;
	TransformFunc = _transformFunc;
	DefaultXOffset = _xOffset;
	DefaultYOffset = _yOffset;
	DefaultRotation = _rotation;
	DefaultDepth = _depth;
	XOffset = DefaultXOffset;
	YOffset = DefaultYOffset;
	Rotation = DefaultRotation;
	DepthOffset = DefaultDepth;
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
			var instance = instance_create_layer(Instance.x, Instance.y, Instance.layer, child.Object);
			child.Instance = instance;
		}
    }
	
	/*
		Insert description here
	*/
	static SetOffset = function(_xOffset, _yOffset) {
		XOffset = _xOffset.x;
		YOffset = _yOffset.y;
    }
	
	/*
		Insert description here
	*/
	static ResetOffset = function() {
		XOffset = DefaultXOffset;
		YOffset = DefaultYOffset;
    }
	
	/*
		Insert description here
	*/
	static SetRotation = function(_rotation) {
		Rotation = _rotation;
    }
	
	/*
		Insert description here
	*/
	static ResetRotation = function() {
		Rotation = DefaultRotation;
    }
	
	/*
		Insert description here
	*/
	static SetDepthOffset = function(_depthOffset) {
		DepthOffset = _depth;
    }
	
	/*
		Insert description here
	*/
	static ResetRotation = function() {
		DepthOffset = DefaultDepth;
    }
	
	/*
		Insert description here
	*/
	static UpdateTransform = function() {
		if (Object != noone && !is_undefined(TransformFunc) && script_exists(TransformFunc)) {
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
}