/*
	Insert description here
	return:
*/
function CreateDbInteractionDataMap() {
	var interactionMap = ds_map_create();
	var allInteraction = GetDbAllInteractionArray();
	var arrayLength = array_length(allInteraction);
	
	for (var i = 0; i < arrayLength; i++) {
		var interaction = allInteraction[i];
		interactionMap [? interaction.Index] = interaction;
	}	
	
	return interactionMap;
}

/*
	Insert description here
	param: _interactionIndexes - Insert description here
	return:
*/
function GetDbInteractionListByIndexArray(_interactionIndexes) {
	with (obj_controller_database) {
		var interactionList = ds_list_create();
		var arrayLength = array_length(_interactionIndexes);
	
		for (var i = 0; i < arrayLength; i++) {
			var interactionIndex = _interactionIndexes[i];
			var interaction = ds_map_find_value(dbInteractionMap, interactionIndex);
			ds_list_add(interactionList, interaction);
		}
		return interactionList;
	}
}
	
/*
	Insert description here
	return: 
*/
function GetDbAllInteractionArray() {
	return [
		new Interaction(InteractionIndex.Lift, "Lift"),
		new Interaction(InteractionIndex.Push, "Push"),
		new Interaction(InteractionIndex.Collect, "Collect"),
		new Interaction(InteractionIndex.Mine, "Mine")
	];
}