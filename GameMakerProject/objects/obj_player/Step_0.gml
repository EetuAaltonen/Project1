/// @description Insert description here
// You can write your code in this editor
var keyUp = keyboard_check(ord("W"));
var keyLeft = keyboard_check(ord("A"));
var keyDown = keyboard_check(ord("S"));
var keyRight = keyboard_check(ord("D"));
var keyRun = keyboard_check(vk_shift);

if (is_undefined(GetGUIStatement())) {
	switch (characterStatement) {
		case CharacterStatement.Mine: {
			// Interrupt movement
		} break;
		default: {
			var hMove = keyRight - keyLeft;
	
			// Run or Walk
			speedVector.x = keyRun ? hMove * runSpeed : hMove * walkSpeed;
			speedVector.x = HorizontalCollision(self);
			x += speedVector.x;
	
			speedVector.y += global.GRAVITY
			speedVector.y = VerticalCollision(self);
			y += speedVector.y;
	
			if (IsObjectGrounded(self)) {
				// Jump
				if (keyUp) {
					speedVector.y -= jumpSpeed;
					characterStatement = CharacterStatement.Flip;
				} else if (speedVector.x != 0) {
					characterStatement = CharacterStatement.Walk;
				} else {
					characterStatement = CharacterStatement.Idle;	
				}
			} else {
				if (characterStatement == CharacterStatement.Flip) {
					/*if (speedVector.y >= 0) {
						characterStatement = CharacterStatement.Fall;	
					}*/
				} else if (characterStatement == CharacterStatement.Fall) {
					if (IsObjectGrounded(self)) {
						characterStatement = CharacterStatement.Idle;
					}
				}
			}	
		}
	}
	
	image_xscale = speedVector.x != 0 ? sign(speedVector.x) : image_xscale;
	
	transform.AnimationTriggerValue = characterStatement;
	transform.UpdateTransform();
}