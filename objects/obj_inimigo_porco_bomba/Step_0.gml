//pausa
if(global.pause) {
	//pausa a animação
	image_speed = 0;
	exit;
} else {
	image_speed = 1;	
}
velv+=grav;
/*if(place_meeting(x,y + 1,obj_chao))
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
*/
//se ainda eu não levei dano e levei dano, eu vou para o sprite de dano 
if(dano && !tomei_dano)
{
estado = "hit";	
tomei_dano = true;
}
if(pode_cair == false)
{
	 if(place_meeting(x + (velh * 10), y + 1, obj_chao) == false ){
		    velh *= -1;
		}
}

switch(estado) {
    case "idle":
		if(global.pause) 
		image_speed = 0;
        muda_sprite(spr_porco_bomba_idle);
        velh = 0;
        ver_o_player();
        // Diminui o tempo
        if (estado == "idle") {
            velv = 0;
        }
        timer_estado--;
        if (timer_estado <= 0) {
            estado = choose("run");
            timer_estado = tempo_estado;

            if (estado == "run") {
                velh = choose(-vel, vel);
            }
        }
        break;

    case "run":
	if(global.pause) exit;
        muda_sprite(spr_porco_bomba_run);
        ver_o_player();
        // Olhando para o lado certo
        if (velh != 0) {
            image_xscale = sign(velh);
        }
        
         //se eu bater na parede, eu volto
	if(place_meeting(x + velh,y,obj_chao)){
	    velh *= -1;
    }
        timer_estado--;
        if (timer_estado <= 0) {
            estado = choose("run", "idle");
            timer_estado = tempo_estado;
        }
		
        break;

    case "joga":
	if(global.pause) exit;
        muda_sprite(spr_porco_bomba_joga);
        velh = 0;

        // Desativar a gravidade
        velv = 0;

        // Se eu terminar a animação, eu volto a ser o porco normal (sem bomba)
        if (image_index >= image_number - 1) {
            // Jogando a bomba
            var _bomba = instance_create_layer(x, y - 14, "Projeteis", obj_bomba);
            _bomba.velh = 3 * image_xscale;
            _bomba.velv = -3;
            _bomba.momento = "on";

            var _novo_porco = instance_create_layer(x, y, "Inimigos", obj_inimigo_porco);
            _novo_porco.estado = "normal";
            _novo_porco.pega_bomba = false;
            _novo_porco.velh = 0;
            _novo_porco.pode_cair = false; // Mantém pode_cair como false

            instance_destroy();
        }
        break;

    case "pega":
	if(global.pause) exit;
        muda_sprite(spr_porco_bomba_pega);
        if (image_index >= image_number - 1) {
            estado = "idle";
        }
        break;

    case "hit":
	if(global.pause) exit;
        muda_sprite(spr_inimigo_porco_dano);
		
		if(image_index >= image_number - 1)
		{
			estado = "dead";
		}
        break;
	case "dead":
	if(global.pause) exit;
		muda_sprite(spr_inimigo_porco_morto);
		if (image_index >= image_number - 1) {
            instance_destroy();
        }
		
	break;
}
