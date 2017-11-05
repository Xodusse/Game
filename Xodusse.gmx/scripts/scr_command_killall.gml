var command = string_upper(text); 

//CLEAR COMMAND:
if (string_pos("KILLALL", command) == true){
  
  with(obj_controller_wave){
    AlienCountRemaining = 0;
  }

  if (instance_exists(obj_enemy)){
    with(obj_enemy){
        instance_destroy();
    }
  }
  
  COMMAND_EXECUTED = true;  
} 
