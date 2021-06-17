/*
	Insert description here
	return:
*/
function GetPlayerPosition(){
	var position = undefined;
	var player = obj_player;
	
	if (instance_exists(player)) {
		position = new Vector2(player.x, player.y);
	}
	
	return position;
}