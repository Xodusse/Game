/// @description Fade message
// © 2017 - Jon Harvey
MessageFade -= DELTA;

y = Y+MessageFade*30;
image_alpha = min(MessageFade,(3-MessageFade)*4);

if (MessageFade<=0){
    
    instance_destroy();
}

