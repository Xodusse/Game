//Set the background position:

/*
 * © 2017 - Reece Warren.
 * MIT License.
 */
 
backgroundX -= FRAME_DELTA;
backgroundX2 += FRAME_DELTA;

if (backgroundX <= -1024){
    backgroundX = 0;
}

if (backgroundX2 >= 2048){
    backgroundX2 = 0;
}

backgroundY -= FRAME_DELTA*0.5;
backgroundY2 += FRAME_DELTA*0.25;

if (backgroundY <= -1024){
    backgroundY = 0;
}

if (backgroundY2 >= 2048){
    backgroundY2 = 0;
}


sinrate += F1/90;
if (sinrate >= 1){
    sinrate = 0;
}

var angle = sinrate * 90

alpha = sin(angle);

/* */
/*  */
