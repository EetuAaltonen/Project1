/*
	Insert description here
	return:
*/
function CreateDbAnimationBindingMap() {
	var animationBindingMap = ds_map_create();
	var bindedObjectNameList = ds_list_create();
	var allAnimationBinding = GetDbAllAnimationBindingArray();
	var arrayLength = array_length(allAnimationBinding);
	
	for (var i = 0; i < arrayLength; i++) {
		var animationBinding = allAnimationBinding[i];
		var objectName = object_get_name(animationBinding.ObjectName);
		if (ds_list_find_index(bindedObjectNameList, objectName) < 0) {
			var animationBindingList = ds_list_create();
			for (var j = i; j < arrayLength; j++) {
				var binding = allAnimationBinding[j];
				if (object_get_name(binding.ObjectName) == objectName) {
					ds_list_add(animationBindingList, binding);
				}
			}
			ds_list_add(bindedObjectNameList, objectName);
			animationBindingMap [? objectName] = animationBindingList;
		}
	}	
	
	return animationBindingMap;
}

/*
	Insert description here
	param: _objectName - Insert description here
	return:
*/
function GetDbAnimationListByObjectName(_objectName) {
	with (obj_controller_database) {
		var animationBindingList = ds_map_find_value(dbAnimationBindingMap, _objectName);
		var animationList = ds_list_create();
		
		if (!is_undefined(animationBindingList)) {
			var listSize = ds_list_size(animationBindingList);
		
			for (var i = 0; i < listSize; i++) {
				var animationBinding = ds_list_find_value(animationBindingList, i);
				var animation = GetDbAnimationByAnimationIndex(animationBinding.AnimationIndex);
				animation.TriggerValue = animationBinding.AnimationTriggerValue;
				ds_list_add(animationList, animation);
			}
		}
		
		return animationList;
	}
}

/*
	Insert description here
	return:
*/
function GetDbAllAnimationBindingArray() {
	// Object names are mapped afterward
	return [
		// Player walk
		new AnimationBinding(obj_player_head, AnimationIndex.PlayerWalkHead, CharacterStatement.Walk),
		new AnimationBinding(obj_player_r_arm, AnimationIndex.PlayerWalkRightArm, CharacterStatement.Walk),
		new AnimationBinding(obj_player_l_arm, AnimationIndex.PlayerWalkLeftArm, CharacterStatement.Walk),
		new AnimationBinding(obj_player_r_leg, AnimationIndex.PlayerWalkRightLeg, CharacterStatement.Walk),
		new AnimationBinding(obj_player_l_leg, AnimationIndex.PlayerWalkLeftLeg, CharacterStatement.Walk),
		// Player jump
		new AnimationBinding(obj_player_r_arm, AnimationIndex.PlayerJumpRightArm, CharacterStatement.Jump),
		new AnimationBinding(obj_player_l_arm, AnimationIndex.PlayerJumpLeftArm, CharacterStatement.Jump),
		new AnimationBinding(obj_player_r_leg, AnimationIndex.PlayerJumpRightLeg, CharacterStatement.Jump),
		new AnimationBinding(obj_player_l_leg, AnimationIndex.PlayerJumpLeftLeg, CharacterStatement.Jump),
		// Player fall
		new AnimationBinding(obj_player_r_arm, AnimationIndex.PlayerFallRightArm, CharacterStatement.Fall),
		new AnimationBinding(obj_player_l_arm, AnimationIndex.PlayerFallLeftArm, CharacterStatement.Fall),
		new AnimationBinding(obj_player_r_leg, AnimationIndex.PlayerFallRightLeg, CharacterStatement.Fall),
		new AnimationBinding(obj_player_l_leg, AnimationIndex.PlayerFallLeftLeg, CharacterStatement.Fall),
		// Player mine
		new AnimationBinding(obj_player_r_arm, AnimationIndex.PlayerMineRightArm, CharacterStatement.Mine),
		new AnimationBinding(obj_player_l_arm, AnimationIndex.PlayerMineLeftArm, CharacterStatement.Mine),
		new AnimationBinding(obj_player_r_leg, AnimationIndex.PlayerMineRightLeg, CharacterStatement.Mine),
		new AnimationBinding(obj_player_l_leg, AnimationIndex.PlayerMineLeftLeg, CharacterStatement.Mine),
		// Player flip
		new AnimationBinding(obj_player_head, AnimationIndex.PlayerFlipHead, CharacterStatement.Flip),
		new AnimationBinding(obj_player, AnimationIndex.PlayerFlipBody, CharacterStatement.Flip),
		new AnimationBinding(obj_player_r_arm, AnimationIndex.PlayerFlipRightArm, CharacterStatement.Flip),
		new AnimationBinding(obj_player_l_arm, AnimationIndex.PlayerFlipLeftArm, CharacterStatement.Flip),
		new AnimationBinding(obj_player_r_leg, AnimationIndex.PlayerFlipRightLeg, CharacterStatement.Flip),
		new AnimationBinding(obj_player_l_leg, AnimationIndex.PlayerFlipLeftLeg, CharacterStatement.Flip)
	];
}