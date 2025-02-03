//Get player inputs.
keyUp = keyboard_check( ord( "W" )) || keyboard_check( vk_up );
keyLeft = keyboard_check( ord( "A" )) || keyboard_check( vk_left );
keyDown = keyboard_check( ord( "S" )) || keyboard_check( vk_down );
keyRight = keyboard_check( ord( "D" )) || keyboard_check( vk_right );
keyJump = keyboard_check( vk_space );
keyActionButton1 = keyboard_check( ord( "1" ) );
keyActionButton2 = keyboard_check( ord( "2" ) );
keyActionButton3 = keyboard_check( ord( "3" ) );
keyActionButton4 = keyboard_check( ord( "4" ) );
keyActionButton5 = keyboard_check( ord( "Q" ) );
keyActionButton6 = keyboard_check( ord( "E" ) );
keyActionButton7 = keyboard_check( ord( "R" ) );
keyActionButton8 = keyboard_check( ord( "F" ) );
keyActionButton9 = keyboard_check( ord( "Z" ) );
keyActionButton10 = keyboard_check( ord( "X" ) );
keyActionButton11 = keyboard_check( ord( "C" ) );
keyActionButton12 = keyboard_check( ord( "V" ) );

inputDirection = point_direction( 0, 0, keyRight - keyLeft, keyDown - keyUp);
inputMagnitude = ( keyRight - keyLeft != 0 ) || ( keyDown - keyUp !=0 );


//if ( !global.gamePaused ) script_execute( state );//intended to be part of the pauser (part of oGame) that references the scripts we are creating.
//script_execute( state );	intended to be part of the PlayerState machine...

//Movement processing.
xSpeed = lengthdir_x( inputMagnitude * speedWalk, inputDirection );
ySpeed = lengthdir_y( inputMagnitude * speedWalk, inputDirection );

PlayerCollision();

#region This was supposed to be handled in the script -> 'PlayerAnimateSprite'
//Update Sprite.
var _totalFrames = sprite_get_number( sprite_index ) / 8; //Not entirely sure why 8 works, but 4 does not.
image_index = localFrame + ( CARDINAL_DIR * _totalFrames );
localFrame += sprite_get_speed( sprite_index ) / FRAME_RATE; //uses our Frame Rate Macro :)

//If animation would loop on the next game step.
if ( localFrame >= _totalFrames )
	{
		animationEnd = true;
		localFrame -= _totalFrames;
	} else animationEnd = false;
#endregion

#region This was supposed ot be handled in the script -> 'PlayerCollision'
var _collision = false;

	//Horizontal Tiles.
	if ( tilemap_get_at_pixel ( collisionMap, x + xSpeed , y ) )
		{
			x -= x mod TILE_SIZE;
			if ( sign ( xSpeed ) == 1 ) x += TILE_SIZE - 1;
			xSpeed = 0;
			_collision = true;
		}

	//Horizontal movement commit.	
	x += xSpeed;
	
	//Verticale Tiles.
	if ( tilemap_get_at_pixel( collisionMap, x , y + ySpeed ) )
		{
			y -= y mod TILE_SIZE;
			if ( sign ( ySpeed ) == 1 ) y += TILE_SIZE - 1;
			ySpeed = 0;
			_collision = true;
		}

	//Vertical movement commit.	
	y += ySpeed;
#endregion

#region Update Sprite and Image Index
//Updating the Sprite Index.
//var _oldSpirte = sprite_index;
//if ( inputMagnitude !=0 ) //stores the direction if we have no input magnitude, to sustain the direction facing.
// ^ Additionally, because we are based on Mag, this keeps in input for animation if we run into a wall for example.
//	{
//		direction = inputDirection;
//		sprite_index = spriteRun;
//	} else sprite_index = spriteIdle;
//if (_oldSpirte != sprite_index ) localFrame = 0;

//Updating the Image Index
image_index = PlayerAnimateSprite( direction );
#endregion