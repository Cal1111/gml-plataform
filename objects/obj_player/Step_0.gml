//para a transicao acontecer
if(global.transicao != false) exit;

//pausa
if(global.pause) {
	//pausa a animação
	image_speed = 0;
	exit;
} else {
	image_speed = 1;	
}
switch(estado){
 case "normal":
	 estado_normal();
 break;
 case "in":
	mudando_sprite(spr_player_door_in);
	var _img_vel = sprite_get_speed(sprite_index) / room_speed;
	//indo para o estado normal 
	if(image_index >= image_number - _img_vel)
	{
	 image_speed = 0;
	 image_index = image_number - 1;
	 image_alpha = 0;
	}
 break;
 case "out":
	mudando_sprite(spr_player_door_out); 
	var _img_vel = sprite_get_speed(sprite_index) / room_speed;
	//indo para o estado normal 
	if(image_index >= image_number - _img_vel)
	{
	estado = "normal";	
	}
	
 break;
 case "dead":
 mudando_sprite(spr_player_dead);
 timer_reinicia--;
 if(timer_reinicia <= 0)
 {
	global.vida = global.max_vida;
    game_restart();	 
 }
 //ficando visível
 if(image_alpha < 1)
 {
   image_alpha += 0.1;	 
 }
 if(image_index >= image_number - 1)
 {
	image_speed = 0;	
	image_index = image_number - 1 ;
 }
 
 break;
}