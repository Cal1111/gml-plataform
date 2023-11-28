if(global.pause) exit;
//checando colisão
var _colih = instance_place(x + velh,y,obj_chao);
if(_colih){
         //checando se estou indo para a direita
		 if(velh > 0){
			 //gruda na parte esquerda da parede
			 x = _colih.bbox_left + (x - bbox_right);
		 }
		  //checando se estou indo para a esquerda
		 if(velh < 0){
			  x = _colih.bbox_right + (x - bbox_left);
		 }
		 //uma vez que colido, eu paro
		 velh=0;
}	
//colisão horizontal
x += velh;
var _coliv = instance_place(x,y + velv, obj_chao);
if(_coliv){
        //checando se estou indo para cima
		 if(velv > 0){
			 y = _coliv.bbox_top + (y - bbox_bottom);
			
		 }
		  //checando se estou indo para baixo
		 if(velv < 0){
			   y = _coliv.bbox_bottom + (y - bbox_top);
		 }
		 //uma vez que colido, eu paro
		 velv=0;
}	
y += velv;