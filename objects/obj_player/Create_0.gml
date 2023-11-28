
//para fazer o player pausar
if(global.pause) exit;
velv = 0;
velh = 0;
vel = 4;
grav = .2;
vel_jump = 6;

posso_perder_vida = true;
dano = false;
tempo_dano = room_speed*0.5;
timer_dano = 0;

inv_tempo = room_speed*2;
inv_timer = 0;
//variáveis do knockback
knockback = 3;
knockback_duration = 10;
knockback_timer = 0;

tempo_reinicia = room_speed * 2;
timer_reinicia = tempo_reinicia;

//estado do player
estado = "out";

	sprite_index = spr_player_door_out;
	image_speed = 0;
	//criando a transição de saída da porta
    layer_sequence_create("Transicao", x, y, sq_transicao_out);

inputs = {
left: ord("A"),
right: ord("D"),
jump: ord("K"),
}

estado_normal = function()
{ 
	image_speed = 1;

	//controlando player
	var _chao = place_meeting(x,y + 1,obj_chao);
	var _left, _right, _jump;

	_left = keyboard_check(inputs.left);
	_right = keyboard_check(inputs.right);
	_jump = keyboard_check_pressed(inputs.jump);

	//só consigo me controlar se eu não tomei dano
	if(timer_dano <= 0){
	velh = (_right - _left) * vel;
	}

	//pulando
	if(_chao){
	if(_jump){
	velv = -vel_jump;
	}	
	//checando se estou no chão e me movendo
	if(velh != 0){
		//mudo a sprite
		sprite_index = spr_player_run;
	
		//faço o personagem olhar para onde estou indo
		image_xscale = sign(velh);
	} else {
		//mudo a sprite
		sprite_index = spr_player_idle;
		
	}
	} 

	//aplica gravidade
	else {
	if(velv < 0){
		sprite_index = spr_player_jump;
	} else {
		sprite_index = spr_player_fall;	
		//se estou indo para baixo, eu posso pular em cima da cabeça do inimigo
		var _inimigo = instance_place(x,y + 3, obj_inimigo_pai);
		if(_inimigo){
			dano = false;
			if(_inimigo.morto == false){
		//subo pra cima no ar
		velv = -vel_jump;
		
		//enviando dado que o inimigo tomou dano
		_inimigo.dano = true;
			}
		}
	}
	
	velv += grav;
	if(velh != 0){
	image_xscale = sign(velh);
	}
	}

	if(dano){
	sprite_index = spr_player_hit;
	
	 velh = 0;
	 // Aplica o empurrão
        var angle = point_direction(x, y, -other.x, other.y);
        x += lengthdir_x(knockback, angle);
        y += lengthdir_y(knockback, angle);
       knockback_timer = knockback_duration;
	   //empurra para longe do inimigo
	   angle -= 180;
	//faz o personagem dar um pulo para trás, por causa do dano
	if(posso_perder_vida)
	{
		//faz os corações diminuirem
	global.vida--;
	if(global.vida <= 0)
	{
	 estado = "dead";
	} 
	
		posso_perder_vida = false;
	
	}
}
	if(inv_timer > 0){
	inv_timer--;
	image_alpha = 0.5;
	} else {

	image_alpha = 1;
	}
	// Atualiza o timer do empurrão
if (knockback_timer > 0) {
    knockback_timer--;
}

	//se o timer do dano for maior do que zero, eu diminuo ele
	if(timer_dano > 0){
	timer_dano--;
	} else {
	dano = false;
	posso_perder_vida = true;
	}
	//tomando dano
	var _inimigo = instance_place(x,y, obj_inimigo_pai);

	if(_inimigo && inv_timer <= 0)
	{
	//dando o valor do timer dano
		if(_inimigo.morto == false && _inimigo.dano == false){	 
			timer_dano = tempo_dano;
			inv_timer = inv_tempo;
			dano = true;
		}
	}
}
