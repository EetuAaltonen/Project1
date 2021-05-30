/*
	Insert description here
	param: _source - Insert description here
	param: _target - Insert description here
*/
function InteractionPushObject(_source, _target) {
	if (instance_exists(_source) && instance_exists(_target)) {
		var forceX = _source.x >= _target.x ? -4 : 4;
		var pushVec = new Vector2(forceX, -6);
		with (_target) {
			speedVector.x += pushVec.x;
		}
		TriggerInteractionCooldown();
		ResetInteraction();
	}
}