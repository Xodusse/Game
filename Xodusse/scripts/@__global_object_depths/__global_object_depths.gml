// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = -32768; // obj_initialize
global.__objectDepths[1] = 0; // obj_init_display
global.__objectDepths[2] = 0; // obj_game_object
global.__objectDepths[3] = -2; // obj_player
global.__objectDepths[4] = -2; // obj_enemy
global.__objectDepths[5] = -10; // obj_wall
global.__objectDepths[6] = 0; // obj_rug_large
global.__objectDepths[7] = 0; // obj_rug_small
global.__objectDepths[8] = 0; // obj_table
global.__objectDepths[9] = 0; // obj_chair
global.__objectDepths[10] = -1; // obj_crate
global.__objectDepths[11] = 0; // obj_crate_spawner
global.__objectDepths[12] = 0; // obj_item
global.__objectDepths[13] = 0; // obj_Barrel
global.__objectDepths[14] = 1; // obj_Barrel_Puddle
global.__objectDepths[15] = -10; // obj_foliage_fern_1
global.__objectDepths[16] = 0; // obj_projectiles
global.__objectDepths[17] = 0; // obj_grenade
global.__objectDepths[18] = -11; // obj_explosion
global.__objectDepths[19] = -50; // obj_controller_keys
global.__objectDepths[20] = -50; // obj_controller_debugger
global.__objectDepths[21] = -50; // obj_controller_console
global.__objectDepths[22] = -50; // obj_controller_level_selector
global.__objectDepths[23] = -50; // obj_controller_wave
global.__objectDepths[24] = -50; // obj_controller_guns
global.__objectDepths[25] = -50; // obj_controller_inventory
global.__objectDepths[26] = -50; // obj_controller_gui
global.__objectDepths[27] = -50; // obj_controller_menu
global.__objectDepths[28] = -49; // obj_controller_normal
global.__objectDepths[29] = 0; // obj_controller_tiles
global.__objectDepths[30] = -10000; // obj_controller_cursor
global.__objectDepths[31] = -55; // obj_button_large
global.__objectDepths[32] = -55; // obj_button_small
global.__objectDepths[33] = -55; // obj_button_pause
global.__objectDepths[34] = -51; // obj_message


global.__objectNames[0] = "obj_initialize";
global.__objectNames[1] = "obj_init_display";
global.__objectNames[2] = "obj_game_object";
global.__objectNames[3] = "obj_player";
global.__objectNames[4] = "obj_enemy";
global.__objectNames[5] = "obj_wall";
global.__objectNames[6] = "obj_rug_large";
global.__objectNames[7] = "obj_rug_small";
global.__objectNames[8] = "obj_table";
global.__objectNames[9] = "obj_chair";
global.__objectNames[10] = "obj_crate";
global.__objectNames[11] = "obj_crate_spawner";
global.__objectNames[12] = "obj_item";
global.__objectNames[13] = "obj_Barrel";
global.__objectNames[14] = "obj_Barrel_Puddle";
global.__objectNames[15] = "obj_foliage_fern_1";
global.__objectNames[16] = "obj_projectiles";
global.__objectNames[17] = "obj_grenade";
global.__objectNames[18] = "obj_explosion";
global.__objectNames[19] = "obj_controller_keys";
global.__objectNames[20] = "obj_controller_debugger";
global.__objectNames[21] = "obj_controller_console";
global.__objectNames[22] = "obj_controller_level_selector";
global.__objectNames[23] = "obj_controller_wave";
global.__objectNames[24] = "obj_controller_guns";
global.__objectNames[25] = "obj_controller_inventory";
global.__objectNames[26] = "obj_controller_gui";
global.__objectNames[27] = "obj_controller_menu";
global.__objectNames[28] = "obj_controller_normal";
global.__objectNames[29] = "obj_controller_tiles";
global.__objectNames[30] = "obj_controller_cursor";
global.__objectNames[31] = "obj_button_large";
global.__objectNames[32] = "obj_button_small";
global.__objectNames[33] = "obj_button_pause";
global.__objectNames[34] = "obj_message";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for