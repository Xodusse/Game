/// @description Update keypresses
// © 2017 - Jon Harvey

//Set key to be assigned whenever a key is released.
if keyboard_check_released(vk_anykey)
{
    Kmap = keyboard_lastkey;
}

//Change key
if Kassign && keyboard_key
{
    switch(Kmap)
    {
        case KIleft:
        KIleft = keyboard_key;
        break;
        case KIright:
        KIright = keyboard_key;
        break;
        case KIup:
        KIup = keyboard_key;
        break;
        case KIdown:
        KIdown = keyboard_key;
        break;
        case KIturnleft:
        KIturnleft = keyboard_key;
        break;
        case KIturnright:
        KIturnright = keyboard_key;
        break;
        case KImelee:
        KImelee = keyboard_key;
        break;
        case KIreload:
        KIreload = keyboard_key;
        break;
        //© 2017 - Reece Warren
        //Function Keys:
        case KIreset:
        KIreset = keyboard_key;
        break;
        case KIdebug:
        KIdebug = keyboard_key;
        break;
        case KIescape:
        KIescape = keyboard_key;
        break;
        case KIconsole:
        KIconsole = keyboard_key;
        break;
        case KIinventory:
        KIinventory = keyboard_key;
        break;
    }
    Kassign = 0;
    Kmap = 0;
}

//Check all keys

Kleft = keyboard_check(KIleft)*                   !CONSOLE_ENABLED;
Kright = keyboard_check(KIright)*                 !CONSOLE_ENABLED;
Kup = keyboard_check(KIup)*                       !CONSOLE_ENABLED;
Kdown = keyboard_check(KIdown)*                   !CONSOLE_ENABLED;
Kturnleft = keyboard_check(KIturnleft)*           !CONSOLE_ENABLED;
Kturnright = keyboard_check(KIturnright)*         !CONSOLE_ENABLED;
Kmelee = keyboard_check_pressed(KImelee)*         !CONSOLE_ENABLED;
Kreload = keyboard_check_released(KIreload)*      !CONSOLE_ENABLED;
Kinventory = keyboard_check_released(KIinventory)*!CONSOLE_ENABLED;

//© 2017 - Reece Warren
//Function Keys:
Kreset = keyboard_check_released(KIreset)*!CONSOLE_ENABLED;
Kdebug = keyboard_check_released(KIdebug)*!CONSOLE_ENABLED;

Kconsole = keyboard_check_released(KIconsole);
Kescape = keyboard_check_released(KIescape);

//Number keys:
K1 = keyboard_check_released(KI1)*!CONSOLE_ENABLED;
K2 = keyboard_check_released(KI2)*!CONSOLE_ENABLED;
K3 = keyboard_check_released(KI3)*!CONSOLE_ENABLED;
K4 = keyboard_check_released(KI4)*!CONSOLE_ENABLED;
K5 = keyboard_check_released(KI5)*!CONSOLE_ENABLED;
K6 = keyboard_check_released(KI6)*!CONSOLE_ENABLED;

//Quit game
if !(CONSOLE_ENABLED) && (Kescape) {

    if !(CONSOLE_ENABLED) && (Kescape) && (room != rm_main) && (room != rm_game) && (room != rm_options) {
        PAUSED = !PAUSED;
        
        //Create pause menu buttons:
        if (PAUSED == true){
        
            var button0 = instance_create(
                (__view_get( e__VW.XView, 0 )+(__view_get( e__VW.WView, 0 )/2)),
                (__view_get( e__VW.YView, 0 )+(__view_get( e__VW.HView, 0 )/2)),
                obj_button_pause);
            button0.BUTTON_TYPE = 0;
            
            var button0 = instance_create(
                (__view_get( e__VW.XView, 0 )+(__view_get( e__VW.WView, 0 )/2))-(dcos(VIEW_ANGLE+90)*-64),
                (__view_get( e__VW.YView, 0 )+(__view_get( e__VW.HView, 0 )/2))-(dsin(VIEW_ANGLE+90)*-64),
                obj_button_pause);
            button0.BUTTON_TYPE = 1;
            
        }    
    }
}

