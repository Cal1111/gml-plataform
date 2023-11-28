//pausa
if(global.pause) {
	//pausa a animação
	image_speed = 0;
	exit;
} else {
	image_speed = 1;	
}
velv += grav;

if(place_meeting(x,y + 1,obj_chao))
{
	if(velh != 0)
	{
	  velh *= .9;
	}
} 
else 
{
 velh *= .995;	
}

//vira uma bomba, quando a bala para, porquê não?
if(abs(velh) <= 0.1){
	//eu viro uma bomba
	//vou criar uma bomba no meu lugar
	instance_create_layer(x,y + sprite_height/2, layer ,obj_bomba);
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
	var _bomba = instance_place(x,y, obj_bomba);
		 if(_bomba){
			 if(_bomba.momento == "off"){
				_bomba.boom_timer = 1; 
				_bomba.momento = "on"; 
			 }
		}