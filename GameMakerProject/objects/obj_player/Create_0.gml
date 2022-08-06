/// @description Insert description here
transform = new Transform(object_get_name(obj_player), self, undefined, TransFuncPlayerBody, new Vector2(0, 0), new Scale(1, 1), 0, 0);
speedVector = new Vector2(0, 0);
walkSpeed = 4;
runSpeed = 6;
jumpSpeed = 8;

characterStatement = CharacterStatement.Idle;

createAllChild = true;