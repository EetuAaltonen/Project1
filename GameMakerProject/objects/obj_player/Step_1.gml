/// @description Insert description here
if (createAllChild) {
	createAllChild = false;
	var rightHand = transform.GetChildTransformByObject(obj_player_r_arm);
	rightHand.AddChild(new Transform(obj_weapon_sword, undefined, rightHand, TransFuncPlayerLimb, new Vector2(0, 18), 1, 1, -80, -1));
	var itemData = GetDbItemDataBySprite(spr_weapon_sword);
	UpdateHotbarPrimaryItem(itemData);

	var head = transform.GetChildTransformByObject(obj_player_head);
	head.AddChild(new Transform(obj_headgear_top_hat, undefined, head, TransFuncPlayerLimb, new Vector2(0, -28), 1, 1, 0, -1));
	
	transform.CreateAllChild();
}