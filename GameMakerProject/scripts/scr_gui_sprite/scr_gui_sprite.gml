/*
	Insert description here
	param: _sprite
	return:
*/
function StrechSpriteNineSliceScale(_sprite, _targetSize) {
	var spriteSize = new Size(sprite_get_width(_sprite), sprite_get_height(_sprite));
	var hScale = _targetSize.Width / spriteSize.Width;
	var vScale = _targetSize.Height / spriteSize.Height;
	return new Scale(hScale, vScale);
}

/*
	Insert description here
	param: _sprite
	param: _speed - Insert description here
	return:
*/
function GetSpriteCenterMargin(_sprite) {
	var xSprOrigin = sprite_get_xoffset(_sprite);
	var ySprOrigin = sprite_get_yoffset(_sprite);
	var sprWidth = sprite_get_width(_sprite);
	var sprHeight = sprite_get_height(_sprite);
	
	var leftMargin = -(floor(sprWidth / 2) - xSprOrigin);
	var topMargin = -(floor(sprHeight / 2) - ySprOrigin);
	
	return new Margin(leftMargin, topMargin, 0, 0);
}