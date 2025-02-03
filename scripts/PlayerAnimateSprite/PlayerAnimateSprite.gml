//function PlayerAnimateSprite( direction )
//{
// I MOVED THIS TO THE oPlayer Step event, and it worked... not sure why.

//Update Sprite.
//var _cardinalDirection = round( direction / 45 );
//var _totalFrames = sprite_get_number( sprite_index ) / 4; //32 Frames for 8 directions = 4 each.
//image_index = localFrame + ( _cardinalDirection * _totalFrames );
//localFrame += sprite_get_speed( sprite_index ) / FRAME_RATE; //uses our Frame Rate Macro :)

//If animation would loop on the next game step.
//if ( localFrame >= _totalFrames )
//	{
//		animationEnd = true;
//		localFrame -= _totalFrames;
//	} else animationEnd = false;

//return _imageIndex;

//}