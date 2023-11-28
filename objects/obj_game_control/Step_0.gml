
//verifica se estou na rm_tela_incial
if (room == rm_tela_inicial) {
//MENU
var _up = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"));
var _down = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S")) ;
var _select = keyboard_check_pressed(vk_enter) or  keyboard_check_pressed(vk_space);
var _move = _down - _up;
if (_move != 0) {
	
	//move index
	index += _move;
	
	//clamp values
	var _size = array_length_2d(opcoes, sub_menu);
	if index < 0 index = _size - 1; // at start the loop
	else if index >= _size index = 0; //at end the loop
		
}
//faz a seleção de menu do jogo
if _select {
	switch(sub_menu)
	 {   
	 case 0: //main menu
	 switch(index)
	 {
		  //start the game
		  case 0:
		    room_goto_next();
		  break;
  
		  //opções
		  case 1:
			sub_menu = 1;
			index = 0;
		  break;
		  //exit
		  case 2:
			game_end();
		  break;
		}
	 
	 break;
	 
	 //options
	 case 1: //sub_menu
	 switch(index)
	 {
		  case 0:
		    //Gráficos
			sub_menu = 2;
			index = 0;
		  break;
  
		  case 1:
			//áudio
			sub_menu = 3;
			index = 0;
		  break;
	  
		  case 2:
	        //idioma 
			sub_menu = 4;
			index = 0;
		  break;
	  
		  case 3:
		   //voltar	
		   sub_menu = 0;
		   index = 1;
		  break;
	  
		
		}
		break;
		//GRAPHICS
	 case 2: 
	 switch(index)
	 {
	
		  case 0:
		    //WINDOW

		  break;
  
		  case 1:
			//FULLSCREEN

		  break;
	  
		  case 2:


		  break;
	  
	  
		  case 3:
		   //voltar	
		  sub_menu = 1;
		  index = 0;
		  break;
		}
	break;
	//AUDIO
	 case 3: 
	 switch(index)
	 {
	
		  case 0:
		    //Music type:slider

		  break;
  
		  case 1:
			//áudio type:slider

		  break;
	  
		  case 2:
	       //language
		   
		  break;
		  
		  case 3:
	      //voltar	
		  sub_menu = 1;
		  index = 1;
		  break;

		}
		break;
	//CONTROLS type:input
	 case 4: 
	 switch(index)
	 {
	
		  case 0:
		    //WINDOW

		  break;
  
		  case 1:
			//áudio
 
		  break;
			
		  case 2:
			//áudio

		  break;
		  
		  case 3:
			//áudio

		  break;
		  
		  case 4:
	      //voltar	
		  sub_menu = 1;
		  index = 2;
		  break;

		}
	break;
		}
	}
}

//PAUSE GAME
if(keyboard_check_pressed(vk_escape))
{
 //pausando
 global.pause = !global.pause; 
} 
