var command = string_upper(text); 

//HELP COMMAND:
if (string_pos("HELP",command) == true) || (string_pos("HELP 1",command) == true){
    
    text = "";
    
    string7 = "--- COMMAND LIST [Page 1] ---";
    string6 = "/TP [X] [Y] - Teleport to position (Supports 6s.f integer numbers MAX).";
    string5 = "/TPX [X] - Teleports in the X coordinate.";
    string4 = "/TPY [Y] - Teleports in the Y coordinate.";
    string3 = "/CLEAR - Clears the console history.";
    string2 = "";
    string1 = "";
    string0 = "Type /help 2 to view next page...";

}
