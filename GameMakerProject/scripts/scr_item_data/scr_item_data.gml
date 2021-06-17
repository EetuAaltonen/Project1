/*
	Insert description here
	param: _sourceItemData - Insert description here
	param: _compareItemData - Insert description here
	return:
*/
function CompareItemData(_sourceItemData, _compareItemData){
	var equalItemData = false;
	
	if (!is_undefined(_sourceItemData) && !is_undefined(_compareItemData))
		equalItemData = (
			_sourceItemData.SpriteName == _compareItemData.SpriteName &&
			_sourceItemData.ObjectName == _compareItemData.ObjectName &&
			_sourceItemData.Name == _compareItemData.Name &&
			_sourceItemData.EquipmentSlot == _compareItemData.EquipmentSlot
		);
	
	return equalItemData;
}