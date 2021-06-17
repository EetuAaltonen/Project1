/*
	Insert description here
	param: _source - Insert description here
	param: _target - Insert description here
*/
function InteractionPushObject(_source, _target) {
	var forceX = _source.x >= _target.x ? -4 : 4;
	var pushVec = new Vector2(forceX, -6);
	with (_target) {
		speedVector.x += pushVec.x;
	}
	TriggerInteractionCooldown();
	ResetInteraction();
}

/*
	Insert description here
	param: _player - Insert description here
	param: _vein - Insert description here
*/
function InteractionMine(_player, _vein) {
	with (_player) {
		if (_player.characterStatement == CharacterStatement.Mine) {
			_player.characterStatement = CharacterStatement.Idle;
			TriggerInteractionCooldown();
			ResetInteraction();
		} else {
			var primaryItem = GetInventoryEquipmentByEquipmentSlot(EquipmentSlot.Primary);
			if (!is_undefined(primaryItem)) {
				if (primaryItem.SpriteName == _vein.oreVein.RequiredToolName) {
					_player.characterStatement = CharacterStatement.Mine;
				}
			}
		}
	}
}