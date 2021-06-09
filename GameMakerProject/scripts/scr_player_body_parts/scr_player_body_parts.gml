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
		var rotatedPos = _transform.Offset.Rotate(parentInstance.image_angle);
		
		instance.x = parentInstance.x + rotatedPos.x;
		instance.y = parentInstance.y + rotatedPos.y;
		instance.image_xscale = _transform.Scale.Horizontal * xDir;
		instance.image_yscale = _transform.Scale.Vertical * yDir;
		instance.image_angle = (parentInstance.image_angle + (_transform.Rotation * xDir));
		instance.depth = parentInstance.depth + (_transform.Depth * xDir);
	} else {
		instance_destroy();	
	}
}