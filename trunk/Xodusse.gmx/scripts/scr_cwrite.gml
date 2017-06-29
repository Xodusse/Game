//WRITE SETTINGS TO CONFIG:

var Config_File = file_text_open_write(working_directory + "Config.Xodusse");

//Assign Settings:
var C_Vsync = obj_initialize.SETTING_VSYNC;
var C_Interpolation = obj_initialize.SETTING_INTERPOLATION;
var C_FXAA = obj_initialize.SETTING_FXAA;
var C_Fullscreen = obj_initialize.SETTING_FULLSCREEN;
var C_Resolution = obj_initialize.SETTING_RESOLUTION;

//Write Settings:
file_text_write_string(Config_File, "[ XODUSSE CONFIGURATION ]");
file_text_writeln(Config_File);
file_text_writeln(Config_File);

file_text_write_string(Config_File, "VSYNC: ");
file_text_write_real(Config_File, C_Vsync);
file_text_writeln(Config_File);

file_text_write_string(Config_File, "INTERPOLATION: ");    
file_text_write_real(Config_File, C_Interpolation);
file_text_writeln(Config_File);

file_text_write_string(Config_File, "FXAA: ");
file_text_write_real(Config_File, C_FXAA);
file_text_writeln(Config_File);

file_text_write_string(Config_File, "FULLSCREEN: ");
file_text_write_real(Config_File, C_Fullscreen);
file_text_writeln(Config_File);

file_text_write_string(Config_File, "RESOLUTION: ");
file_text_write_real(Config_File, C_Resolution);
file_text_writeln(Config_File);


file_text_close(Config_File);

