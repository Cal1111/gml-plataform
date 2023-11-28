//pausa
if(global.pause) {
	//pausa a animação
	image_speed = 0;
	exit;
} else {
	image_speed = 1;	
}
velv += grav;
var _chao = place_meeting(x,y + 1, obj_chao);
if(_chao != 0)
{
	velv = 0;
}
if( momento == "off"){

sprite_index = spr_bomba;

} else if (momento == "on"){

sprite_index  = spr_bomba_on;

	if(boom_timer > 0){
		boom_timer--;
	} else {
		momento = "boom";
	}

} else if (momento == "boom"){
//checar se o tempo do sprite acabou
if(sprite_index != spr_bomba_boom){
sprite_index = spr_bomba_boom;
image_index=0;
}

if(image_index >= image_number-1){
instance_destroy();
}
var _player = instance_place(x,y,obj_player);
if(_player){
	with(_player){
	dano = true;
	timer_dano = tempo_dano;
	inv_timer = inv_tempo;
		}
	}
}