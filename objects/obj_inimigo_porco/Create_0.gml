if(global.pause)exit; 
// Inherit the parent event
event_inherited();
vel= choose(1, -1);
estado = "normal";

pega_bomba = true;

andando = choose(true,false);

if(andando)
	{
	velh = choose(vel,-vel);
	} else {
	velh = 0;
	}
	//reseta tempo de andar
tempo_decidir_andar = room_speed * 2; 
tempo_decidir_andar = room_speed;

//esse método faz com que o porco não bugue com uma animação infinita e branca
//sendo assim, independente de qual animação ele morra
porco_morre = function(){
if(dano && morto == false){
				sprite_index = spr_inimigo_porco_dano;
				velh=0;
			} 	
}