/// @description Insert description here
if (!instance_exists(obj_player)) instance_destroy();

/*var _self = self;
with (obj_player) {
	_self.image_xscale = image_xscale;
	_self.x = x;
	_self.y = y - _self.headOffset;
}*/
// Animation
// Headgear
headgearOffset += (headgearOffsetStep * headgearOffsetDir);
if (headgearOffset >= headgearMaxOffset) {
	headgearOffset = headgearMaxOffset;
	headgearOffsetDir = -1;
} else if (headgearOffset <= headgearDefaultOffset) {
	headgearOffset = headgearDefaultOffset;
}