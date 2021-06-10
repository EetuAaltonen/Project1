/*
	Insert description here
	param: _object - Insert description here
	return:
*/
function InitAnimator(_transform) {
	var animationList = GetDbAnimationListByObjectName(_transform.ObjectName);
	if (ds_list_size(animationList) > 0) {
		var animator = instance_create_layer(0, 0, "Animators", obj_controller_animator);
		animator.animationList = animationList;
		_transform.BindAnimator(animator);
	}
}