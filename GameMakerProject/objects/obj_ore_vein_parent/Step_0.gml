/// @description Insert description here
if (IsHighlighted(self)) {
	var player = obj_player;
	if (instance_exists(player)) {
		if (player.characterStatement == CharacterStatement.Mine) {
			var rightArmTransform = player.transform.GetChildTransformByObjectName(object_get_name(obj_player_r_arm));
			var activeAnimationStep = GetTransformActiveAnimationStep(rightArmTransform);
			
			if (!is_undefined(activeAnimationStep)) {
				if (activeAnimationStep.InteractionTriggerValue == InteractionTriggerValue.MineOre &&
					previousInteractionTrigger != activeAnimationStep.InteractionTriggerValue) {
					var itemData = GetDbItemDataBySprite(asset_get_index(oreVein.OreSpriteName));
					var spawnPosition = new Vector2(x, y - 20);
					SpawnCollectableItem(itemData, spawnPosition, true);
				}
				previousInteractionTrigger = activeAnimationStep.InteractionTriggerValue;
			}
		}
	}
}