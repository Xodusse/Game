var command = string_upper(text); 

//CLEAR COMMAND:
if (string_pos("ALIENMAX", command) == true){
  
  var amount = real(string_digits(command));

  with(obj_controller_wave){
    AlienMax = amount;
  }
  
  COMMAND_EXECUTED = true;  
} 
