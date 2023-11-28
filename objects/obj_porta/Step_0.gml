//se tá rolando uma transição, o meu player não faz nada
if(global.transicao != false) exit;

switch (estado)
{
case "idle":
sprite_index = spr_porta;
image_speed = 1;
//se o jogador apertou para cima, ele entra na porta
var _player = instance_place(x,y,obj_player);
if(_player)
{
	//checando se o jogador apertou para cima
	if(keyboard_check_pressed(ord("W")) && saida)
	{
		estado = "abrindo";	
		//fazendo o player ir para o estado "in"
		_player.estado = "in";
		velh = 0;
	}
}
break;

case "abrindo":
mudando_sprite(spr_porta_abre);

//terminou de abrir, ela fica em parado
if(image_index >= image_number - 1)
{
 image_speed = 0;	
 //crio a transição de abrindo a porta
 layer_sequence_create("Transicao", obj_player.x, obj_player.y, sq_transicao_in);
}

break;

case "fechando":
mudando_sprite(spr_porta_fechando);
//saindo do estado de fechando
if(image_index >= image_number -1)
{
estado = "idle";	
}
break;
}



