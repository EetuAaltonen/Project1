/*
	Insert description here
	param: _angle - Insert description here
	param: _speed - Insert description here
	return:
*/
function GetGUIStatement() {
	var controller = obj_controller_gui;
	var statement = GUIStatement.Undefined;
	if (instance_exists(controller)) {
		with (controller) {
			statement = guiStatement;	
		}
	}
	return statement;
}

/*
	Insert description here
	param: _angle - Insert description here
	param: _speed - Insert description here
	return:
*/
function SetGUIStatement(_statement) {
	var controller = obj_controller_gui;
	if (instance_exists(controller)) {
		with (controller) {
			guiStatement = _statement;
		}
	}
}