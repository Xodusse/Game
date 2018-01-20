/// @description Cursor Targeting:
//© 2017 - Reece warren

if (CURSOR_TARGETING){
    Cursor_Counter -= FRAME_DELTA_OVERRIDE;
    if (Cursor_Counter <= 0){
        Cursor_Sprite = spr_Cursor_Target;
        Cursor_Counter = 1;    
        Cursor_Frame = ((Cursor_Frame + 1) % 8);
        if (Cursor_Zoom == true){
            Cursor_Scale = Cursor_Scale + 0.1;
            if (Cursor_Scale >= 1.5){
                Cursor_Zoom = false;
            }
        }
        else {
            Cursor_Scale = Cursor_Scale - 0.1;
            if (Cursor_Scale <= 1){
                Cursor_Zoom = true;
            }            
        }
    }
    Cursor_Angle = ((Cursor_Angle - (6 * FRAME_DELTA_OVERRIDE)) % 360);
}

else {
    Cursor_Sprite = spr_Cursor_Free;
    Cursor_Frame = 0;
    Cursor_Angle = 0;
    Cursor_Scale = 1;
}



