/// Insert description here
enum Interaction {
	Lift,
	Push,
}

/*
	Insert description here
	return: 
*/
function GetInteractionMap() {
	var  map = ds_map_create();
	map [? "Lift"] = Interaction.Lift;
	map [? "Push"] = Interaction.Push;
	
	return map;
}