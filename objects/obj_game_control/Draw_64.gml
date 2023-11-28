//if(global.pause) exit;
//posições dos corações do player
var _x = 20;
var _y = 40;

var _qtd = 30;
//desenhando os corações
if (room != rm_tela_inicial) {
    repeat(global.vida) {
		
        desenha_coracao(_x, _y);
        // O _x aumenta em _qtd
        _x += _qtd;
    }
}


//desenhar a tela de inicio do jogo
draw_set_font(ft_menu);
var _dist = 60;
//altura e largura
var _gui_h = display_get_gui_height();
var _gui_w = display_get_gui_width();
//altura em x e y
var _x1 = _gui_w / 2;
var _y1 = _gui_h / 2;
//faz essa tela aparecer somente na rm_tela_inicial
if (room == rm_tela_inicial) {
for(var i = 0; i < array_length_2d(opcoes, sub_menu); ++i;)
	{
		if(index == i)
	{
		draw_set_color(c_red);
	} 
		else 
	{
		draw_set_color(c_white);	
	}
	 draw_set_halign(fa_center);
	 draw_set_valign(fa_center);
	 draw_text(_x1, _y1 + (_dist * i),opcoes[sub_menu, i]);
	// draw_sprite_ext(spr_slider,0,x,y, 16,16,0, c_white,1);
	}
}

//tela de pause
if(global.pause)
{
	//posso desenhar a tela de pause
	draw_set_alpha(0.7);
	draw_set_color(c_black);
	draw_rectangle(0,0,_gui_w, _gui_h,false );
	//resetando as variáveis 
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_set_font(ft_menu);
	draw_text(_gui_w/2,_gui_h/2, "Pausado");
}
