//state = PlayerStateFree; this is supposed to work with PlayerStateFree & PlayerStateJump scripts...

collisionMap = layer_tilemap_get_id( layer_get_id ( "Col" ));

image_speed = 0; //stops sprite image for spinning
xSpeed = 0; //horizontal speed
ySpeed = 0; //vertical speed
speedWalk = 2.0; //how many fames it moves in one second
speedJump = 3.0;
distanceJump = 10;

spriteIdle = sPlayer;
//spriteJump = sPlayerJump;
spriteRun = sPlayerRun;
//spriteWalk = sPlayerWalk;
localFrame = 0;
