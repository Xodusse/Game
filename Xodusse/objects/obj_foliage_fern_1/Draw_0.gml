/// @description Draw the foliage sprites:

/*
 * © 2017 - Reece Warren, MIT License.
 */
var i;
i = sprite_count;
for (i = sprite_count; i > 0; i--){
    scr_lighting_draw_sprite(spr_foliage_fern_1,spr_foliage_fern_1_n,spr_foliage_fern_1_she,image_index,Position[i,0],Position[i,1],1,1,Position[i,2],-1,1);
}

/* */
/*  */
