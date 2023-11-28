if(global.pause)exit;
// Inherit the parent event
event_inherited();

dano = false;
morto = false;

//checar se estou com a sprite correta
muda_sprite = function(_sprite){
	if(sprite_index != _sprite){
		sprite_index = _sprite;
		image_index = 0;
	}
}