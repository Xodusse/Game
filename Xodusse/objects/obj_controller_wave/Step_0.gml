//Wave Control
// © 2017 - Reece Warren, Jon Harvey

//Only spawn aliens and perform calculations if in the game room:
if (room == rm_test1) || (room == rm_game_0){
    
    if (instance_exists(obj_enemy)){
        AlienCountCurrent = instance_number(obj_enemy);
    }
    
    else {
        AlienCountCurrent = 0;
    }
    
    //Spawn more aliens if under the memory allocation and there are aliens in the current wave left to spawn:
    if (AlienCountCurrent < AlienMax) && (AlienCountRemaining > 0){   
        //Deduct an alien from the wave count:
        AlienCountRemaining--;
        //Spawn the alien:
        var A = random(360); 
        instance_create(obj_player.x+dcos(A)*500,obj_player.y+dsin(A)*500,obj_enemy);
    }
    
    //Starts a new wave:
    if (AlienCountCurrent == 0) && (AlienCountRemaining == 0){
        
        //Start new wave:
        Wave ++;
        WaveNumber += 1;
        
        //Adds five aliens each wave:
        AlienCountRemaining = AlienCountInitial + ((Wave - 1) * 5);
        
    }
}


