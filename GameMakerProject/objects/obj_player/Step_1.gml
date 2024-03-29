/// @description Insert description here
if (createAllChild) {
	createAllChild = false;
	
	// Create limbs
	transform.AddChild(new Transform(object_get_name(obj_player_head), undefined, transform, TransFuncPlayerHead, new Vector2(0, -24), new Scale(1, 1), 0, -1));
	transform.AddChild(new Transform(object_get_name(obj_player_r_arm), undefined, transform, TransFuncPlayerLimb, new Vector2(-2, -20), new Scale(1, 1), 0, -2));
	transform.AddChild(new Transform(object_get_name(obj_player_l_arm), undefined, transform, TransFuncPlayerLimb, new Vector2(2, -20), new Scale(1, 1), 0, 2));
	transform.AddChild(new Transform(object_get_name(obj_player_r_leg), undefined, transform, TransFuncPlayerLimb, new Vector2(-4, 4), new Scale(1, 1), 0, -2));
	transform.AddChild(new Transform(object_get_name(obj_player_l_leg), undefined, transform, TransFuncPlayerLimb, new Vector2(4, 4), new Scale(1, 1), 0, 2));
	
	InitAnimator(transform);
	transform.CreateAllChild();
}