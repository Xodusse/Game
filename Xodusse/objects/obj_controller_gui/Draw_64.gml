var __b__;
__b__ = action_if_variable(PAUSED, false, 0);
if __b__
{
{
///Draw GUI
// © 2017 - Jon Harvey

//Variables for view port width and height.
var S;
S = 64;

if instance_exists(obj_player){

    draw_set_font(FNT_EXUDATION);
    with(obj_player){
    
        //Inner circle.
        draw_set_alpha(0.6);
        //draw_circle_colour(0,GUIH,60,$222222,$333333,0);
        
        draw_primitive_begin(pr_trianglestrip);
        for(var i = 0;i<=30;i++){            
            var Angle = i*3;
            draw_vertex_colour(dcos(Angle)*52,GUIH-dsin(Angle)*52,$999329,0.2);
            draw_vertex_colour(dcos(Angle),GUIH-dsin(Angle),$999329,0.2);
        }        
        draw_primitive_end();
        
        draw_set_alpha(1);
        
        //Outer reload circle.
        var Progress = min(Reload,1);
        if !Grenade{
        
            Progress = min(Reload/Greload[G[Current]],1);
        }
        
        draw_primitive_begin(pr_trianglestrip);
        for(var i = 0;i<=30;i++){
            
            var Angle = i*3*Progress;
            draw_vertex_colour(dcos(Angle)*150,GUIH-dsin(Angle)*150,$D18214,0.3);
            draw_vertex_colour(dcos(Angle)*52,GUIH-dsin(Angle)*52,$999329,0.1);
        }
        draw_primitive_end();
        
        if Count{
            draw_set_colour($FFFFFF);
            if !Grenade{
            
                //Gun info (magazine count, shots count in magazine, magazine capacity).
                draw_text(2,GUIH-40,string_hash_to_newline(string(max(Magazines,0))));
                draw_text(4,GUIH-24,string_hash_to_newline(string(Q[P[Current]])+"/"+string(Gcap[G[Current]])));
            }
            else{
            
                //Grenade info (grenade count).
                draw_text(2,GUIH-40,string_hash_to_newline(string(max(Q[P[Current]],0))));
            }
            
            draw_set_colour(0);
            
            if  Current == Secondary{
                
                //Center gun on outer circle.
                var Item,Angle,Alpha;
                Item = I[P[Current]];
                Angle = 30*Swap-45;
                Alpha = 1;
                draw_sprite_ext(spr_items,Item-1,dcos(Angle)*120,GUIH+dsin(Angle)*120,50/S,50/S,-Angle,-1,1);
                if (Item<=Idoubles*2){
                    
                    draw_sprite_ext(spr_items,Item-2,dcos(Angle)*70,GUIH+dsin(Angle)*70,50/S,50/S,-Angle,-1,1);
                }
                
                //Top gun on outer circle.
                Item = I[P[(Current+1)%Count]];
                Angle = 30*Swap-75;
                Alpha = 0.5+Swap;
                draw_sprite_ext(spr_items,Item-1,dcos(Angle)*120,GUIH+dsin(Angle)*120,40/S,40/S,-Angle,-1,Alpha);
                if (Item<=Idoubles*2){
                    
                    draw_sprite_ext(spr_items,Item-2,dcos(Angle)*80,GUIH+dsin(Angle)*80,40/S,40/S,-Angle,-1,Alpha);
                }
                
                //Bottom gun on outer circle.
                Item = I[P[(Current-1+Count)%Count]];
                Angle = 30*Swap-15;
                Alpha = 0.5-Swap;
                draw_sprite_ext(spr_items,Item-1,dcos(Angle)*120,GUIH+dsin(Angle)*120,40/S,40/S,-Angle,-1,Alpha);
                if (Item<=Idoubles*2){
                    
                    draw_sprite_ext(spr_items,Item-2,dcos(Angle)*80,GUIH+dsin(Angle)*80,40/S,40/S,-Angle,-1,Alpha);
                }
            }
            else{
            
                //Center gun on outer circle.
                var Item,Angle,Alpha;
                Item = I[P[Current]];
                Angle = 30*Swap-45;
                Alpha = 1;
                draw_sprite_ext(spr_items,Item-1,dcos(Angle)*120,GUIH+dsin(Angle)*120,50/S,50/S,-Angle,-1,1);
                
                Item = I[P[Secondary]];
                Angle = -45;
                draw_sprite_ext(spr_items,Item-1,dcos(Angle)*70,GUIH+dsin(Angle)*70,50/S,50/S,-Angle,-1,1);
                
                //Top gun on outer circle.
                Item = I[P[(Current+1)%Count]];
                Angle = 30*Swap-75;
                Alpha = 0.5+Swap;
                draw_sprite_ext(spr_items,Item-1,dcos(Angle)*120,GUIH+dsin(Angle)*120,40/S,40/S,-Angle,-1,Alpha);
                
                //Bottom gun on outer circle.
                Item = I[P[(Current-1+Count)%Count]];
                Angle = 30*Swap-15;
                Alpha = 0.5-Swap;
                draw_sprite_ext(spr_items,Item-1,dcos(Angle)*120,GUIH+dsin(Angle)*120,40/S,40/S,-Angle,-1,Alpha);
            }
        }

        
        //ROUND NUMBER:
        draw_set_colour($FFFFFF);
        
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        
        if (instance_exists(obj_controller_wave)) && (room == rm_game_0){
            draw_set_font(fnt_Exudation_Large);
            draw_text_transformed(GUIW-60,GUIH-100,string_hash_to_newline(string(obj_controller_wave.WaveNumber)),2,2,0);
            draw_set_font(fnt_Exudation);
            draw_text(GUIW-60,GUIH-60,string_hash_to_newline("WAVE:"));
        }
        
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);        
        
        
        //Health bar:       
        draw_set_colour($999329);
               
        draw_rectangle(GUIW-100,GUIH-40,GUIW-100+clamp(Health,0,10)*8,GUIH-20,0);
        
        draw_set_colour($FFFFFF);

        draw_rectangle(GUIW-100,GUIH-40,GUIW-20,GUIH-20,1);         
        
        draw_set_colour(0);
    }
    
    //Inventory system.
    if Ienable{
          
        draw_set_halign(fa_right);
        draw_set_valign(fa_bottom);
        
        //Inventory base.
        draw_set_alpha(0.4);
        draw_rectangle(GUIW/2-S*3.5,GUIH/2-S*1.5-S*Ibackpack,GUIW/2+S*3.5,GUIH/2+S*1.5,0);
        
        //Weight and strength capacity
        draw_rectangle(GUIW/2+S*2.5,GUIH/2-S*2-S*Ibackpack,GUIW/2+S*3.5,GUIH/2-S*1.5-S*Ibackpack-1,0);
        draw_set_alpha(1);
        draw_set_colour($FFFFFF);
        draw_text(GUIW/2+S*3.5,GUIH/2-S*1.5-S*Ibackpack,string_hash_to_newline(string(ceil(Iweight))+"/"+string(Istrength)+" KG"));
        draw_set_alpha(0.4);
        draw_set_colour(0);
        
        //Backpack slot.
        draw_rectangle(GUIW/2+S*4.5,GUIH/2-S*0.5,GUIW/2+S*6.5,GUIH/2+S*1.5,0);
        draw_set_alpha(1);
        draw_set_colour($999329);
        draw_rectangle(GUIW/2+S*5,GUIH/2,GUIW/2+S*6,GUIH/2+S,1);
        draw_set_colour(0);
        if Ibackpack{
        
            draw_sprite(spr_items,Idoubles*2+Isingles+Igrenades+Iammo+Ibackpack-1,GUIW/2+S*5.5,GUIH/2+S*.5);
        }
        
        //Cycle through inventory items.
        for(var Y = 0;Y<2+Ibackpack;Y++)
        for(var X = 0;X<6;X++){
            
            var Item = I[X+Y*6];
            var Quantity = Q[X+Y*6];
            
            //Slot square.
            draw_set_colour($999329);
            draw_rectangle(GUIW/2-S*3+1+X*S,GUIH/2+1-Y*S,GUIW/2-S*2-1+X*S,GUIH/2+S-1-Y*S,1);
            draw_set_colour(0);
            
            if Item{
                
                //Item sprite.
                draw_sprite(spr_items,Item-1,GUIW/2-S*2.5+X*S,GUIH/2+S/2-Y*S);
                
                //Item quantity.
                if Quantity{
                    
                    draw_set_colour($FFFFFF);
                    draw_text(GUIW/2-S*2-2+X*S,GUIH/2+S-Y*S,string_hash_to_newline(Quantity));
                }
            }
        }
        
        //Item being moved.
        if Iid{
        
            var X,Y;
            X = window_mouse_get_x();
            Y = window_mouse_get_y();
            
            //Item sprite.
            draw_sprite(spr_items,Iid-1,X,Y);
            //Item's second part if it's a double.
            if Iid<=Idoubles*2{
            
                draw_sprite(spr_items,Iid-2+2*(Iid%2),X-S+S*2*(Iid%2),Y);
            }
            //Item quantity.
            if Iquantity{
            
                draw_set_colour($FFFFFF);
                draw_text(X+S/2-2+S*(Iid&1)*(Iid<=Idoubles*2),Y+S/2,string_hash_to_newline(Iquantity));
            }
        }
        draw_set_colour(0);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    }
    draw_set_font(-1);
}

}
}
