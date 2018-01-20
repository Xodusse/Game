/*   
    © 2017 - Jon Harvey, Reece Warren.
    MIT License.
    
    Initialization room.
    
    This room creates an instance of obj_initialize to initialize the game if it has not
    been created and the display manager object:    
*/

//Fixed minor typo - Jon
if !(instance_exists(obj_initialize)){
    instance_create(0,0,obj_initialize);
}

if !(instance_exists(obj_init_display)){
    instance_create(0,0,obj_init_display);
}

//Added room switch - Jon
room_goto_next();