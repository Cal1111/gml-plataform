


//método para desenhar os corações
desenha_coracao = function(_x,_y)
{
	//corações 
	draw_sprite_ext(spr_coracao, 10 * (get_timer() / 1000000), _x,_y,3,3,0, c_white,1);
}


//MENU
opcoes[0,0] = "NEW GAME";
opcoes[0,1] = "OPTIONS";
opcoes[0,2] = "EXIT";

//OPTIONS
opcoes[1,0] = "GRAPHICS";
opcoes[1,1] = "AUDIO";
opcoes[1,2] = "CONTROL";

opcoes[1,3] = "BACK";

//GRAPHICS 
opcoes[2,0] = "WINDOW";
opcoes[2,1] = "SDAS";
opcoes[2,2] = "SEILA";

opcoes[2,3] = "BACK";

//Audio 
opcoes[3,0] = "MASTER VOLUME"; // type: Slider
opcoes[3,1] = "MUSIC"; // type: Slider
opcoes[3,2] = "LANGUAGE"; //type: ?

opcoes[3,3] = "BACK";

//CONTROL
opcoes[4,0] = "A"; // type: S
opcoes[4,1] = "D"; // type: 
opcoes[4,2] = "W"; //type: ?
opcoes[4,3] = "SPACE"; //type: ?

opcoes[4,4] = "VOLTAR";

index = 0; //index position
sub_menu = 0; //sub_menu position


//pause the game
global.pause = false;

