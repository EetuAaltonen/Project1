/*
	Insert description here
	param: _transform - Insert description here
*/
function TransFuncPlayerHead(_transform) {
	var instance = _transform.Instance;
	var parent = _transform.Parent;
	if (instance_exists(_transform.Parent.Instance)) {
		TransFuncPlayerLimb(_transform);
		instance.depth = parent.Instance.depth + _transform.Depth;
	} else {
		instance_destroy();	
	}
}

/*
	Insert description here
	param: _transform - Insert description here
*/
function TransFuncPlayerLimb(_transform) {
	var instance = _transform.Instance;
	var parentInstance = _transform.Parent.Instance;
	if (instance_exists(parentInstance)) {
		var xDir = sign(parentInstance.image_xscale);
		var yDir = sign(parentInstance.image_yscale);
		
		var animatedTransform = GetAnimatedTransform(_transform);
		if (is_undefined(animatedTransform)) { animatedTransform = _transform; }
		
		var rotatedPos = animatedTransform.Offset.Rotate(parentInstance.image_angle);
		instance.x = parentInstance.x + rotatedPos.x;
		instance.y = parentInstance.y + rotatedPos.y;
		instance.image_xscale = animatedTransform.Scale.Horizontal * xDir;
		instance.image_yscale = animatedTransform.Scale.Vertical * yDir;
		instance.image_angle = (parentInstance.image_angle + (animatedTransform.Rotation * xDir));
		instance.depth = parentInstance.depth + (animatedTransform.Depth * xDir);
	} else {
		instance_destroy();
	}
}