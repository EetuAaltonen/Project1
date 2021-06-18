/// @description Insert description here
transform = new Transform(object_get_name(obj_npc_merchant), self, undefined, undefined, new Vector2(0, 0), new Scale(1, 1), 0, 0);
speedVector = new Vector2(0, 0);
characterStatement = CharacterStatement.Idle;
interactions = [InteractionIndex.Talk];
createAllChild = true;