/*
	Insert description here
	param: _index - Insert description here
*/
function GUIButtonGroup(_index) constructor {
	Index = _index;
	Buttons = ds_list_create();
	
	static AddGUIButton = function(_button) {
		ds_list_add(Buttons, _button);	
	}
}