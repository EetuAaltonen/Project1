/*
	Insert description here
	param: _transform - Insert description here
*/
function TransFuncPlayerHead(_transform) {
	var instance = _transform.Instance;
	var parent = _transform.Parent;
	if (instance_exists(_transform.Parent.Instance)) {
		var xDir = sign(parent.Instance.image_xscale);
		instance.x = parent.Instance.x + _transform.XOffset;
		instance.y = parent.Instance.y + _transform.YOffset;
		instance.image_xscale = xDir;
		instance.image_angle = _transform.Rotation;
		instance.depth = parent.Instance.depth + _transform.DepthOffset;
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
	var parent = _transform.Parent;
	if (instance_exists(_transform.Parent.Instance)) {
		var xDir = sign(parent.Instance.image_xscale);
		instance.x = parent.Instance.x + _transform.XOffset;
		instance.y = parent.Instance.y + _transform.YOffset;
		instance.image_xscale = xDir;
		instance.image_angle = _transform.Rotation;
		instance.depth = parent.Instance.depth + (DepthOffset * xDir);
	} else {
		instance_destroy();	
	}
}