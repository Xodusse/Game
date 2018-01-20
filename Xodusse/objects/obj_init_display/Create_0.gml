//© 2017 - Reece Warren.
//MIT License.

///Display Properties:
//Reference: https://www.youtube.com/watch?v=wv3R2Q536ZU&t=1154s

ideal_width=0;
ideal_height=540;
zoom=1;
max_zoom=1;

//Higher the number, the wider the display, the taller the display, the smaller:
aspect_ratio=display_get_width()/display_get_height();

ideal_width = round(ideal_height*aspect_ratio);
//ideal_height=round(ideal_width / aspect_ratio);

//Pixel Perfect Scaling:
if(display_get_width() % ideal_width != 0){
    var d = round(display_get_width()/ideal_width);
    ideal_width = display_get_width()/d;
}

if(display_get_height() % ideal_height != 0){
    var d = round(display_get_height()/ideal_height);
    ideal_height = display_get_height()/d;
}

//Check for odd number widths:
if (ideal_width & 1){
    ideal_width++;
}
//Check for odd number heights:
if (ideal_height & 1){
    ideal_height++;
}


max_zoom=floor(display_get_width()/ideal_width);

//Enable the views in every single room automatically:
for(var i=1; i<=room_last; i++){
    if(room_exists(i)){
        room_set_view(i,0,true,0,0,ideal_width,ideal_height,0,0,ideal_width,ideal_height,0,0,0,0,-1);
        room_set_view_enabled(i,true);
    }
}

//Resize the surface:
surface_resize(application_surface,ideal_width*2,ideal_height*2);
window_set_size(ideal_width,ideal_height);

room_goto(room_next(room));


