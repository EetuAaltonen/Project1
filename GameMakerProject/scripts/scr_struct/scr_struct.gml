/*
	Insert description here
	param: _source - Insert description here
	param: _target - Insert description here
*/
function CloneStructValues(_source, _target){
	var variableNameArray = variable_struct_get_names(_source);
	var arrayLength = array_length(variableNameArray)
		
	for (var i = 0; i < arrayLength; i++) {
		var variableName = variableNameArray[i];
		var value = variable_struct_get(_source, variableName);
		variable_struct_set(_target, variableName, value);
	}
	return _target;
}