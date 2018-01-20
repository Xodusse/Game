//Determine the number of crates to spawn:
SPAWN_AMOUNT = irandom_range(2,10);

//spawn the crates
repeat(SPAWN_AMOUNT){
    
    var angle = irandom(360);
    var distance_x = irandom_range(32,96);
    var distance_y = irandom_range(32,96);
    
    if !collision_circle(x+(dcos(angle)*distance_x),y+(dsin(angle)*distance_y),16,obj_crate,0,0){
    
        var crate = instance_create(x+(dcos(angle)*distance_x),y+(dsin(angle)*distance_y),obj_crate);
        crate.image_angle = irandom(360);
    }
}

//Destroy the parent instance:
instance_destroy();    

