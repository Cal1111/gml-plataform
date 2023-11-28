
// Inherit the parent event
event_inherited();
visao = 100;
estado = "idle";//idle, run, pega, joga;

vel = 1;
tempo_estado = room_speed * 5;
timer_estado = tempo_estado;

tomei_dano = false;
ver_o_player = function()
{	
	//variável que da uma linha para ver o player, utilizando collision_line();
	var _vi_player = collision_line(x , y-14 , x + visao * image_xscale, y-14, obj_player ,false, true);
	
	if(_vi_player)
	{
	estado = "joga";	
	}
}
