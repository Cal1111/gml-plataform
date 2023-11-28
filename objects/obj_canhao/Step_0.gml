//pausa
if(global.pause) {
	//pausa a animação
	image_speed = 0;
	exit;
} else {
	image_speed = 1;	
}
switch(estado) {
    // Ele parado
    case "idle":
        muda_sprite(spr_canhao);
        criei_bala = false;
        break;

    // Ele atirando
    case "on":
        muda_sprite(spr_canhao_on);
        if (image_index >= 1.5 && !criei_bala) {
            // Eu vou criar a bola de canhão
            var _bola = instance_create_layer(x + (5 * image_xscale), y - 11, "Projeteis", obj_bola_canhao);
            _bola.velh = (7 + random_range(-3, 3)) * image_xscale;
            _bola.velv = -2;
            criei_bala = true;
        }
        if (image_index >= image_number - 1) {
            estado = "espera";
        }
        break;

    case "espera":
        muda_sprite(spr_canhao);
        timer_tiro--;
        // Se o tempo de espera terminou, volta ao idle e reseta
        if (timer_tiro <= 0) {
            timer_tiro = tempo_tiro;
            estado = "idle";
        }
        break;
}
