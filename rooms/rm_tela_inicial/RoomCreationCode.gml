//criando o objeto game controller 
//checa se não existe um game_control no jogo
if(!instance_exists(obj_game_control))
{
instance_create_depth(0,0,0, obj_game_control);
}
