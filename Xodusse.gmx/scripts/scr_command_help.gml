var command = string_upper(text); 

//HELP COMMAND:
if (string_pos("HELP",command) == true) || (string_pos("HELP 1",command) == true){
    
    text = "";
    
    string7 = "--- COMMAND LIST [Page 1] ---";
    string6 = "/TP [X] [Y] - Teleport to position (Supports 6s.f integer numbers MAX).";
    string5 = "/CLEAR - Clears the console history.";
    string4 = "/GOD - Enables god mode.";
    string3 = "/KILLALL - Kills all aliens and starts a new round.";
    string2 = "/ALIENMAX [n] - Sets the maximum amount of aliens to spawn in one wave.";
    string1 = "";
    string0 = "Type /help 2 to view next page...";

}
