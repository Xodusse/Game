//Set the resolution of the window and view:
//© 2017 - Reece Warren

//Set window width:
if (SETTING_RESOLUTION == 0){
    window_set_size(960,540);
    __view_set( e__VW.WPort, 0, 960 );
    __view_set( e__VW.HPort, 0, 540 );
    __view_set( e__VW.WView, 0, 960 );
    __view_set( e__VW.HView, 0, 540 );
    surface_resize(application_surface, 960*SETTING_SURFACE_SCALE, 540*SETTING_SURFACE_SCALE);
}

else if (SETTING_RESOLUTION == 1){
    window_set_size(1280,720);
    __view_set( e__VW.WPort, 0, 1280 );
    __view_set( e__VW.HPort, 0, 720 );
    __view_set( e__VW.WView, 0, 960 );
    __view_set( e__VW.HView, 0, 540 );    
    surface_resize(application_surface, 1280*SETTING_SURFACE_SCALE, 720*SETTING_SURFACE_SCALE);
}

else if (SETTING_RESOLUTION == 2){
    window_set_size(1366,768);
    __view_set( e__VW.WPort, 0, 1366 );
    __view_set( e__VW.HPort, 0, 768 );
    __view_set( e__VW.WView, 0, 960 );
    __view_set( e__VW.HView, 0, 540 ); 
    surface_resize(application_surface, 1366*SETTING_SURFACE_SCALE, 768*SETTING_SURFACE_SCALE);
}

else if (SETTING_RESOLUTION == 3){
    window_set_size(1600,900);
    __view_set( e__VW.WPort, 0, 1600 );
    __view_set( e__VW.HPort, 0, 900 );
    __view_set( e__VW.WView, 0, 960 );
    __view_set( e__VW.HView, 0, 540 ); 
    surface_resize(application_surface, 1600*SETTING_SURFACE_SCALE, 900*SETTING_SURFACE_SCALE);
}

else if (SETTING_RESOLUTION == 4){
    window_set_size(1920,1080);
    __view_set( e__VW.WPort, 0, 1920 );
    __view_set( e__VW.HPort, 0, 1080 );
    __view_set( e__VW.WView, 0, 960 );
    __view_set( e__VW.HView, 0, 540 ); 
    surface_resize(application_surface, 1920*SETTING_SURFACE_SCALE, 1080*SETTING_SURFACE_SCALE);
}

else if (SETTING_RESOLUTION == 5){
    window_set_size(2560,1440);
    __view_set( e__VW.WPort, 0, 2560 );
    __view_set( e__VW.HPort, 0, 1440 );
    __view_set( e__VW.WView, 0, 960 );
    __view_set( e__VW.HView, 0, 540 ); 
    surface_resize(application_surface, 2560*SETTING_SURFACE_SCALE, 1440*SETTING_SURFACE_SCALE);
}

else if (SETTING_RESOLUTION == 6){
    window_set_size(3840,2160);
    __view_set( e__VW.WPort, 0, 3840 );
    __view_set( e__VW.HPort, 0, 2160 );
    __view_set( e__VW.WView, 0, 960 );
    __view_set( e__VW.HView, 0, 540 ); 
    surface_resize(application_surface, 3840*SETTING_SURFACE_SCALE, 2160*SETTING_SURFACE_SCALE);
}

else if (SETTING_RESOLUTION == 7){
    window_set_size(DISPLAY_HRESOLUTION,DISPLAY_VRESOLUTION);
    __view_set( e__VW.WPort, 0, DISPLAY_HRESOLUTION );
    __view_set( e__VW.HPort, 0, DISPLAY_VRESOLUTION );
    __view_set( e__VW.WView, 0, 960 );
    __view_set( e__VW.HView, 0, 540 ); 
    surface_resize(application_surface, DISPLAY_HRESOLUTION*SETTING_SURFACE_SCALE, DISPLAY_VRESOLUTION*SETTING_SURFACE_SCALE);
}    

else {

    ///TODO:
        //Detect the maximum resolution and determine if config value is lower:
        
    window_set_size(960,540);
    __view_set( e__VW.WPort, 0, 960 );
    __view_set( e__VW.HPort, 0, 540 );
    surface_resize(application_surface, 960*SETTING_SURFACE_SCALE, 540*SETTING_SURFACE_SCALE); 
}

