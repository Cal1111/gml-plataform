//pausa
if(global.pause) {
	//pausa a animação
	image_speed = 0;
	exit;
} else {
	image_speed = 1;	
}
if(morto) {
	sprite_index = spr_inimigo_porco_morto;
	if(image_speed <= 0){
	image_alpha -= 0.01;
	}
	//se eu sumir totalmente, eu me destruo
	if(image_alpha <= 0){
	instance_destroy();	
	}
	exit;
}
	var _chao = place_meeting(x,y + 1, obj_chao);
	
if(estado == "normal"){
	//checando se eu colidi com uma bomba
	var _bomba = instance_place(x,y,obj_bomba);
	if(_bomba && _chao){
		//se eu não pegar a bomba, eu vou ativá-la
		if(pega_bomba == false)
		{
		//chechando se ela está apagada
			if (_bomba.momento == "off"){
				estado = "fosforo_on";
				
				porco_morre();
			}	
		}
		else if(_bomba.momento = "off")
		{
		//então eu vou pegar a bomba!
		instance_destroy(_bomba);
		//eu vou virar outro porco
		var _novo_porco = instance_create_layer(x,y,layer, obj_inimigo_porco_bomba);
			_novo_porco.estado = "pega";
			porco_morre();
			instance_destroy();
		}
		
	} 
	//canhao
	var _canhao = instance_place(x,y,obj_canhao);
	if(_canhao){
		//checando se o canhao está em modo idle
		if(_canhao.estado == "idle"){
			estado = "fosforo_on";
			porco_morre();
		}
	}
		
		
	if(_chao){
		tempo_decidir_andar -= 1;
		if(tempo_decidir_andar <= 0){
			andando = choose(true,false);
			if(andando)
			{
				velh = choose(vel,-vel);
			} else {
			velh = 0;
			}
			//reseta tempo de andar
			tempo_decidir_andar = room_speed * 2; 
			}
	}
	
	if(velh != 0 && dano == false){
		sprite_index = spr_inimigo_porco_run;
		image_xscale = sign(velh);
	} else {
		sprite_index = spr_inimigo_porco_idle;
	}
	
    //se eu bater na parede, eu volto
	if(place_meeting(x + velh,y,obj_chao)){
	    velh *= -1;
    }
    
    if(pode_cair == false){
	    //se eu não posso cair, eu mudo de direção
	    if(place_meeting(x + (velh * 10), y + 1, obj_chao) == false ){
		    velh *= -1;
		}
	}
} else {
	
	velv+=grav;
	//velh=0;
	if(_chao != 0)
	{
	velv=0;
	}
    if(velh != 0){
	    image_xscale = sign(velh);
    }
}

if (estado == "fosforo_on"){
	if(sprite_index != spr_porco_fosforo_on){
	   sprite_index = spr_porco_fosforo_on;
       image_index = 0;
}
	velh = 0;
 
if(image_index >= image_number -1){
	estado = "fosforo_bomba";
}

} else if (estado == "fosforo_bomba"){
	
	if(sprite_index != spr_porco_fosforo_bomba){
		sprite_index = spr_porco_fosforo_bomba;
		image_index = 0;
	}
	//terminando a animação
	if(image_index >= image_number - 1){
		var _bomba = instance_place(x,y, obj_bomba);
		 if(_bomba){
		    _bomba.momento = "on";
			//deixa ele escolher se pega a bomba ou acende ela
			pega_bomba = choose(true, false); 
			porco_morre();
		}
	estado = "normal";
	}	
	var _canhao = instance_place(x,y,obj_canhao);
		if(_canhao){
		  _canhao.estado = "on";
		  //show_message(_canhao.estado);
		}
	//estado = "normal";	
	//show_message(estado);
}



//checando se estou tomando dano 
if(dano && morto == false){
	sprite_index = spr_inimigo_porco_dano;
	velh=0;
} 

if(morto){
    sprite_index = spr_inimigo_porco_morto;
}