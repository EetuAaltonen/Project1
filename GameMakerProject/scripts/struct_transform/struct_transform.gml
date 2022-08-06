/*
	Insert description here
	return:
*/
function Transform(_objectName, _instance, _parent, _transformFunc, _offset, _scale, _rotation, _depth) constructor {
	ObjectName = _objectName;
	Instance = _instance;
	Parent = _parent;
	TransformFunc = _transformFunc;
	Offset = _offset;
	Scale = _scale;
	Rotation = _rotation;
	Depth = _depth;
	Animator = noone;
	AnimationTriggerValue = undefined;
	ChildList = ds_list_create();
	
	/*
		Insert description here
	*/
	static BindAnimator = function(_animator) {
		Animator = _animator;
		Animator.transformInstance = Instance;
    }
	
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
			var childTransform = ds_list_find_value(ChildList, i);
			var childObject = asset_get_index(childTransform.ObjectName);
			var instance = instance_create_depth(Instance.x, Instance.y, Depth, childObject);
			childTransform.Instance = instance;
			if (instance_exists(childTransform.Animator)) {
				childTransform.Animator.transformInstance = childTransform.Instance;
			}
			InitAnimator(childTransform);
			childTransform.UpdateTransform();
			childTransform.CreateAllChild();
		}
    }
	
	/*
		Insert description here
	*/
	static UpdateTransform = function() {
		if (instance_exists(Animator)) {
			if (!is_undefined(Parent)) {
				if (Parent.AnimationTriggerValue != AnimationTriggerValue) {
					AnimationTriggerValue = Parent.AnimationTriggerValue;
				}
			}
			Animator.animationTriggerValue = AnimationTriggerValue;
		}
		
		if (instance_exists(Instance) && !is_undefined(ObjectName) && !is_undefined(TransformFunc) && script_exists(TransformFunc)) {
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
	static GetChildTransformByObjectName = function(_objectName) {
		var childTransform = undefined;
		var listSize = ds_list_size(ChildList);
		for (var i = 0; i < listSize; i++) {
			var child = ds_list_find_value(ChildList, i);
			if (child.ObjectName == _objectName) {
				childTransform = child;
				break;
			} else {
				if (ds_list_size(child.ChildList) > 0) {
					var iterateChild = child.GetChildTransformByObjectName(_objectName);
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