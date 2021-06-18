/*
	Insert description here
	param: renderData - Insert description here
	return:
*/
function SetGUIItemListRenderData(_renderData) {
	var controller = obj_controller_gui;
	if (instance_exists(controller)) {
		with (controller) {
			itemListRenderData = _renderData;	
		}
	}
}