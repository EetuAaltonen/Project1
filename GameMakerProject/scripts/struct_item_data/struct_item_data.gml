/*
	Insert description here
	param: _spriteName - Insert description here
	param: _objectName - Insert description here
	param: _name - Insert description here
	param: _equipmentSlot - Insert description here
*/
function ItemData(_spriteName, _objectName, _name, _equipmentSlot) constructor {
	SpriteName = _spriteName;
	ObjectName = _objectName;
	Name = _name;
	Count = 1;
	EquipmentSlot = _equipmentSlot;
	
	/*
		Insert description here
	*/
	static Copy = function() {
		var copyAnimation = new ItemData(undefined, undefined, undefined, undefined);
		copyAnimation = CloneStructValues(self, copyAnimation);
		return copyAnimation;
    }
}