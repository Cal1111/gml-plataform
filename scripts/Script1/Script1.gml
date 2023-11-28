// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

if(keyboard_check_pressed(ord("F"))){

	if(window_get_fullscreen())
	{
		window_set_fullscreen(false);
	}
	else 
	{
		window_set_fullscreen(true);	
}
}
randomize();

global.transicao = true;
    // Configurar o sistema de vida aqui
    global.max_vida = 3;
    global.vida = global.max_vida;

//criando o objeto de game controller
instance_create_depth(0,0,0, obj_game_control);

function mudando_sprite(_sprite){
	image_speed = 1;
	if(sprite_index != _sprite){
		sprite_index = _sprite;
		image_index = 0;
	}
}
