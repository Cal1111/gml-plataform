/// @description Insert description here
// You can write your code in this editor

estado = "espera"; //idle, on, espera

criei_bala = false;
tempo_tiro = room_speed * 5;
timer_tiro = tempo_tiro;

//checar se estou com a sprite correta
muda_sprite = function(_sprite){
	if(sprite_index != _sprite){
		sprite_index = _sprite;
		image_index = 0;
	}
}