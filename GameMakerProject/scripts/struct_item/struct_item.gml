/*
	Insert description here
	param: _sprite - Insert description here
	param: _name - Insert description here
	param: _equipSlot - Insert description here
*/
function Item(_sprite, _name, _equipSlot, _instanceObject, _instanceTransFunc, _instanceOffset, _instanceScale, _instanceRotation, _instanceDepth) constructor {
	Sprite = _sprite;
	Name = _name;
	EquipSlot = _equipSlot;
	
	// Instance
	InstanceObject = _instanceObject;
	InstanceTransFunc = _instanceTransFunc;
	InstanceOffset = _instanceOffset;
	InstanceScale = _instanceScale;
	InstanceRotation = _instanceRotation;
	InstanceDepth = _instanceDepth;
}