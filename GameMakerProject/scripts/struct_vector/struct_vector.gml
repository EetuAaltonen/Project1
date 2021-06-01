/*
	Insert description here
	param: _x - Insert description here
	param: _y - Insert description here
*/
function Vector2(_x, _y) constructor {
	x = _x;
	y = _y;
	
	/*
		Insert description here
		param: _angle - Insert description here
		return:
	*/
	static Rotate = function(_angle) {
		var c = dcos(_angle);
		var s = dsin(_angle);
		return new Vector2(c * x + s * y, -s * x + c * y);
	}
}