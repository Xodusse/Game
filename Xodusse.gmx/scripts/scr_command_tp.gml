var command = string_upper(text); 

if (string_pos("TP", command) == true){
    
    //X = 1 fig:
    //--------------------------------------------------------------------
    if (string_char_at(command, 5) == " "){
    
        var string_x = 5;
        xx = real( string_char_at(command, 4) );
        
        //Determine length of string to determine the Y co-ordinate:
        //Y = 1 fig:
        if (string_length(command) == 6){
            yy = real( string_char_at(command, string_x + 1) );
        }                    
        
        //Y = 2 figs:
        else if (string_length(command) == 7){
            if (string_char_at(command, 6) == "-"){
                yy = - real( string_char_at(command, string_x + 2));                            
            }
            else {
                yy = real( string_char_at(command, string_x + 1) + 
                            string_char_at(command, string_x + 2)); 
            }                     
        }
        
        //Y = 3 figs:
        else if (string_length(command) == 8){                                                       
            if (string_char_at(command, 6) == "-"){
                yy = - real( string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3));                            
            }
            else {
                yy = real( string_char_at(command, string_x + 1) + 
                            string_char_at(command, string_x + 2) + 
                            string_char_at(command, string_x + 3) ); 
            }                                                 
        }                    

        //Y = 4 figs:
        else if (string_length(command) == 9){
            if (string_char_at(command, 6) == "-"){
                yy = - real( string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4));                            
            }
            else {
                yy = real( string_char_at(command, string_x + 1) + 
                            string_char_at(command, string_x + 2) + 
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4)); 
            }                     
        }
        
        //Y = 5 figs:
        else if (string_length(command) == 10){
            if (string_char_at(command, 6) == "-"){
                yy = - real( string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4) +
                            string_char_at(command, string_x + 5));                            
            }
            else {
                yy = real( string_char_at(command, string_x + 1) + 
                            string_char_at(command, string_x + 2) + 
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4) +
                            string_char_at(command, string_x + 5)); 
            }                                         
        }
                            
        //Y = 6 figs:
        else if (string_length(command) == 11){
            if (string_char_at(command, 6) == "-"){
                yy = - real( string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4) +
                            string_char_at(command, string_x + 5) +
                            string_char_at(command, string_x + 6));                              
            }
            else {
                yy = real( string_char_at(command, string_x + 1) + 
                            string_char_at(command, string_x + 2) + 
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4) +
                            string_char_at(command, string_x + 5) +
                            string_char_at(command, string_x + 6)); 
            }                                                             
        }                    
        
    }
    
    //X = 2 figs:
    //--------------------------------------------------------------------                
    else if (string_char_at(command, 6) == " "){
    
        var string_x = 6;
        if (string_char_at(command, 4) == "-"){
            xx = -real(string_char_at(command, 5));
        }
        else {
            xx = real( string_char_at(command, 4) + string_char_at(command, 5));
        }
        
        //Determine length of string to determine the Y co-ordinate:
        //Y = 1 fig:
        if (string_length(command) == 7){
            yy = real( string_char_at(command, string_x + 1) );
        }                    
        
        //Y = 2 figs:
        else if (string_length(command) == 8){
            if (string_char_at(command, 7) == "-"){
                yy = - real( string_char_at(command, string_x + 2));                            
            }
            else {
                yy = real( string_char_at(command, string_x + 1) + 
                            string_char_at(command, string_x + 2)); 
            }                  
        }
        
        //Y = 3 figs:
        else if (string_length(command) == 9){
            if (string_char_at(command, 7) == "-"){
                yy = - real( string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3));                            
            }
            else {
                yy = real( string_char_at(command, string_x + 1) + 
                            string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3)); 
            }                    
        }                    

        //Y = 4 figs:
        else if (string_length(command) == 10){
            if (string_char_at(command, 7) == "-"){
                yy = - real( string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4));                            
            }
            else {
                yy = real( string_char_at(command, string_x + 1) + 
                            string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4)); 
            }                     
        }
        
        //Y = 5 figs:
        else if (string_length(command) == 11){
            if (string_char_at(command, 7) == "-"){
                yy = - real( string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4) +
                            string_char_at(command, string_x + 5));                            
            }
            else {
                yy = real( string_char_at(command, string_x + 1) + 
                            string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4) +
                            string_char_at(command, string_x + 5));
            }                                          
        }
                            
        //Y = 6 figs:
        else if (string_length(command) == 12){
            if (string_char_at(command, 7) == "-"){
                yy = - real( string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4) +
                            string_char_at(command, string_x + 5) +
                            string_char_at(command, string_x + 6));                            
            }
            else {
                yy = real( string_char_at(command, string_x + 1) + 
                            string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4) +
                            string_char_at(command, string_x + 5) +
                            string_char_at(command, string_x + 6));
            }                                                             
        }
    }
    
    //X = 3 figs:
    //--------------------------------------------------------------------                 
    else if (string_char_at(command, 7) == " "){
    
        var string_x = 7;
        if (string_char_at(command, 4) == "-"){
            xx = -real(string_char_at(command, 5) + string_char_at(command,6));
        }
        else {
            xx = real( string_char_at(command, 4) + string_char_at(command, 5) + string_char_at(command, 6));
        }
        
        //Determine length of string to determine the Y co-ordinate:
        //Y = 1 fig:
        if (string_length(command) == 8){
            yy = real( string_char_at(command, string_x + 1) );
        }                    
        
        //Y = 2 figs:
        else if (string_length(command) == 9){
            if (string_char_at(command, 8) == "-"){
                yy = - real( string_char_at(command, string_x + 2));                            
            }
            else {
                yy = real( string_char_at(command, string_x + 1) + 
                            string_char_at(command, string_x + 2)); 
            }                   
        }
        
        //Y = 3 figs:
        else if (string_length(command) == 10){
            if (string_char_at(command, 8) == "-"){
                yy = - real( string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3));                            
            }
            else {
                yy = real( string_char_at(command, string_x + 1) + 
                            string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3)); 
            }                    
        }                    

        //Y = 4 figs:
        else if (string_length(command) == 11){
            if (string_char_at(command, 8) == "-"){
                yy = - real( string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4));                            
            }
            else {
                yy = real( string_char_at(command, string_x + 1) + 
                            string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4)); 
            }                     
        }
        
        //Y = 5 figs:
        else if (string_length(command) == 12){
            if (string_char_at(command, 8) == "-"){
                yy = - real( string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4) +
                            string_char_at(command, string_x + 5));                            
            }
            else {
                yy = real( string_char_at(command, string_x + 1) + 
                            string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4) +
                            string_char_at(command, string_x + 5)); 
            }                                        
        }
                            
        //Y = 6 figs:
        else if (string_length(command) == 13){
            if (string_char_at(command, 8) == "-"){
                yy = - real( string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4) +
                            string_char_at(command, string_x + 5) +
                            string_char_at(command, string_x + 6));                            
            }
            else {
                yy = real( string_char_at(command, string_x + 1) + 
                            string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4) +
                            string_char_at(command, string_x + 5) +
                            string_char_at(command, string_x + 6));
            }                                                              
        }
    }
    
    //X = 4 figs:
    //--------------------------------------------------------------------                 
    else if (string_char_at(command, 8) == " "){
    
        var string_x = 8;
        if (string_char_at(command, 4) == "-"){
            xx = -real(string_char_at(command, 5) + string_char_at(command,6) + string_char_at(command,7));
        }
        else {
            xx = real( string_char_at(command, 4) + string_char_at(command, 5) + string_char_at(command, 6) + string_char_at(command,7));
        }
        
        //Determine length of string to determine the Y co-ordinate:
        //Y = 1 fig:
        if (string_length(command) == 9){
            yy = real( string_char_at(command, string_x + 1) );
        }                    
        
        //Y = 2 figs:
        else if (string_length(command) == 10){
            if (string_char_at(command, 9) == "-"){
                yy = - real( string_char_at(command, string_x + 2));                            
            }
            else {
                yy = real( string_char_at(command, string_x + 1) + 
                            string_char_at(command, string_x + 2)); 
            }                    
        }
        
        //Y = 3 figs:
        else if (string_length(command) == 11){
            if (string_char_at(command, 9) == "-"){
                yy = - real( string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3));                            
            }
            else {
                yy = real( string_char_at(command, string_x + 1) + 
                            string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3)); 
            }                    
        }                    

        //Y = 4 figs:
        else if (string_length(command) == 12){
            if (string_char_at(command, 9) == "-"){
                yy = - real( string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4));                            
            }
            else {
                yy = real( string_char_at(command, string_x + 1) + 
                            string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4)); 
            }                     
        }
        
        //Y = 5 figs:
        else if (string_length(command) == 13){
            if (string_char_at(command, 9) == "-"){
                yy = - real( string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4) +
                            string_char_at(command, string_x + 5));                            
            }
            else {
                yy = real( string_char_at(command, string_x + 1) + 
                            string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4) +
                            string_char_at(command, string_x + 5)); 
            }                                        
        }
                            
        //Y = 6 figs:
        else if (string_length(command) == 14){
            if (string_char_at(command, 9) == "-"){
                yy = - real( string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4) +
                            string_char_at(command, string_x + 5) +
                            string_char_at(command, string_x + 6));                            
            }
            else {
                yy = real( string_char_at(command, string_x + 1) + 
                            string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4) +
                            string_char_at(command, string_x + 5) +
                            string_char_at(command, string_x + 6));
            }                                                              
        }
    }
    
    //X = 5 figs:
    //--------------------------------------------------------------------                 
    else if (string_char_at(command, 9) == " "){
    
        var string_x = 9;
        if (string_char_at(command, 4) == "-"){
            xx = -real(string_char_at(command, 5) + string_char_at(command,6) + string_char_at(command,7) + string_char_at(command,8));
        }
        else {
            xx = real( string_char_at(command, 4) + string_char_at(command, 5) + string_char_at(command, 6) + string_char_at(command,7) + string_char_at(command,8));
        }
        
        //Determine length of string to determine the Y co-ordinate:
        //Y = 1 fig:
        if (string_length(command) == 10){
            yy = real( string_char_at(command, string_x + 1) );
        }                    
        
        //Y = 2 figs:
        else if (string_length(command) == 11){
            if (string_char_at(command, 10) == "-"){
                yy = - real( string_char_at(command, string_x + 2));                            
            }
            else {
                yy = real( string_char_at(command, string_x + 1) + 
                            string_char_at(command, string_x + 2)); 
            }                    
        }
        
        //Y = 3 figs:
        else if (string_length(command) == 12){
            if (string_char_at(command, 10) == "-"){
                yy = - real( string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3));                            
            }
            else {
                yy = real( string_char_at(command, string_x + 1) + 
                            string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3)); 
            }                    
        }                    

        //Y = 4 figs:
        else if (string_length(command) == 13){
            if (string_char_at(command, 10) == "-"){
                yy = - real( string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4));                            
            }
            else {
                yy = real( string_char_at(command, string_x + 1) + 
                            string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4)); 
            }                     
        }
        
        //Y = 5 figs:
        else if (string_length(command) == 14){
            if (string_char_at(command, 10) == "-"){
                yy = - real( string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4) +
                            string_char_at(command, string_x + 5));                            
            }
            else {
                yy = real( string_char_at(command, string_x + 1) + 
                            string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4) +
                            string_char_at(command, string_x + 5)); 
            }                                        
        }
                            
        //Y = 6 figs:
        else if (string_length(command) == 15){
            if (string_char_at(command, 10) == "-"){
                yy = - real( string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4) +
                            string_char_at(command, string_x + 5) +
                            string_char_at(command, string_x + 6));                            
            }
            else {
                yy = real( string_char_at(command, string_x + 1) + 
                            string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4) +
                            string_char_at(command, string_x + 5) +
                            string_char_at(command, string_x + 6));
            }                                                              
        }
    }
    
    //X = 6 figs:
    //--------------------------------------------------------------------                 
    else if (string_char_at(command, 10) == " "){
    
        var string_x = 10;
        if (string_char_at(command, 4) == "-"){
            xx = -real(string_char_at(command, 5) + string_char_at(command,6) + string_char_at(command,7) + string_char_at(command,8) + string_char_at(command,9));
        }
        else {
            xx = real( string_char_at(command, 4) + string_char_at(command, 5) + string_char_at(command, 6) + string_char_at(command,7) + string_char_at(command,8) + string_char_at(command,9));
        }
        
        //Determine length of string to determine the Y co-ordinate:
        //Y = 1 fig:
        if (string_length(command) == 11){
            yy = real( string_char_at(command, string_x + 1) );
        }                    
        
        //Y = 2 figs:
        else if (string_length(command) == 12){
            if (string_char_at(command, 11) == "-"){
                yy = - real( string_char_at(command, string_x + 2));                            
            }
            else {
                yy = real( string_char_at(command, string_x + 1) + 
                            string_char_at(command, string_x + 2)); 
            }                    
        }
        
        //Y = 3 figs:
        else if (string_length(command) == 13){
            if (string_char_at(command, 11) == "-"){
                yy = - real( string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3));                            
            }
            else {
                yy = real( string_char_at(command, string_x + 1) + 
                            string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3)); 
            }                    
        }                    

        //Y = 4 figs:
        else if (string_length(command) == 14){
            if (string_char_at(command, 11) == "-"){
                yy = - real( string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4));                            
            }
            else {
                yy = real( string_char_at(command, string_x + 1) + 
                            string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4)); 
            }                     
        }
        
        //Y = 5 figs:
        else if (string_length(command) == 15){
            if (string_char_at(command, 11) == "-"){
                yy = - real( string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4) +
                            string_char_at(command, string_x + 5));                            
            }
            else {
                yy = real( string_char_at(command, string_x + 1) + 
                            string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4) +
                            string_char_at(command, string_x + 5)); 
            }                                        
        }
                            
        //Y = 6 figs:
        else if (string_length(command) == 16){
            if (string_char_at(command, 11) == "-"){
                yy = - real( string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4) +
                            string_char_at(command, string_x + 5) +
                            string_char_at(command, string_x + 6));                            
            }
            else {
                yy = real( string_char_at(command, string_x + 1) + 
                            string_char_at(command, string_x + 2) +
                            string_char_at(command, string_x + 3) +
                            string_char_at(command, string_x + 4) +
                            string_char_at(command, string_x + 5) +
                            string_char_at(command, string_x + 6));
            }                                                              
        }
    }                                                 
    
    if instance_exists(obj_player){
        obj_player.x = xx;
        obj_player.y = yy;
    }
    
    //Record previously entered strings:
    string7 = string6;
    string6 = string5;
    string5 = string4;
    string4 = string3;
    string3 = string2;
    string2 = string1;
    string1 = string0;
    string0 = text;    
    
    COMMAND_EXECUTED = true;  
}
