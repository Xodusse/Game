var command = string_upper(text); 

//CLEAR COMMAND:
if (string_pos("WAVE", command) == true){
  
  var amount = real(string_digits(command));

  with(obj_controller_wave){
    AlienCountRemaining = 0;
    
    if (instance_exists(obj_enemy)){
        with(obj_enemy){
            instance_destroy();
        }
    }
    
    WaveNumber = amount;
    Wave = amount;
    
    AlienCountRemaining = AlienCountInitial + ((Wave - 1) * 5);            
    WaveDelay = false;
  }
  
  COMMAND_EXECUTED = true;  
} 
