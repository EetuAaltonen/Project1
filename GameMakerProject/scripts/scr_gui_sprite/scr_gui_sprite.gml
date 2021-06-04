/*
	Insert description here
	param: _sprite - Insert description here
	return:
*/
function GetSpriteSize(_sprite) {
	var sprWidth = sprite_get_width(_sprite);
	var sprHeight = sprite_get_height(_sprite);
	return new Size(sprWidth, sprHeight);
}

/*
	Insert description here
	param: _sprite - Insert description here
	return:
*/
function GetSpriteOriginOffset(_sprite) {
	var xOffset = sprite_get_xoffset(_sprite);
	var yOffset = sprite_get_yoffset(_sprite);
	return new Vector2(xOffset, yOffset);
}

/*
	Insert description here
	param: _sprite
	return:
*/
function StrechSpriteNineSliceScale(_sprite, _targetSize) {
	var spriteSize = GetSpriteSize(_sprite);
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
	var spriteOrigin = GetSpriteOriginOffset(_sprite);
	var spriteSize = GetSpriteSize(_sprite);
	
	var leftMargin = -(floor(spriteSize.Width / 2) - spriteOrigin.x);
	var topMargin = -(floor(spriteSize.Height / 2) - spriteOrigin.y);
	
	return new Margin(leftMargin, topMargin, 0, 0);
}