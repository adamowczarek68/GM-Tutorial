//Movement for jumping.
//xSpeed = lengthdir_x( speedJump, direction);
//ySpeed = lengthdir_y( speedJump, direction);
//
//moveDistanceRemaining = max( 0, moveDistanceRemaining - speedJump );
//var _collidid = PlayerCollision();
//
////Update out Sprite for the jump.
//sprite_index = spriteJump;
//var _totalFrames = sprite_get_number( sprite_index) / 8;
//image_index = ( CARDINAL_DIR * _totalFrames ) + ( ( 1 - (moveDistanceRemaining / distanceJump ) ) * _totalFrames );
//
////Change State
//if ( moveDistanceRemaining <= 0 )
//	{
//	state = PlayerStateFree;
//	}
