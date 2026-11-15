// --- CONTROLES ---
var tecla_inspecionar = keyboard_check_pressed(vk_space);
var tecla_voltar = keyboard_check(vk_left);

// --- MÁQUINA DE ESTADOS ---
switch (estado) {
    
    case "ESPERA":
    sprite_index = ParadoLado;
    image_speed = 0;

    tempo_espera -= 1;

    show_debug_message(
        "ESPERA | Tempo restante: " + string(tempo_espera)
    );

    if (tempo_espera <= 0) {
        estado = "ANDANDO";
        show_debug_message("MUDOU PARA ANDANDO!");
    }
	break;

    case "ANDANDO":
        show_debug_message("Estado atual: " + estado);
        sprite_index = AndandoLado;
        image_xscale = 1; 
        image_speed = 0.2; 
        
       if (tecla_inspecionar) {
			estado = "INSPECIONANDO";
			image_index = 0;
			tempo_restante_inspecao = tempo_inspecao;
		}
		else if (tecla_voltar) {
			estado = "VOLTANDO";
		}
    break;

    case "VOLTANDO":
        show_debug_message("Estado atual: " + estado);
        sprite_index = AndandoLado;
        image_xscale = -1; 
        image_speed = 0.2;
		
    break;

    case "INSPECIONANDO":

    sprite_index = Interagindo;
    image_speed = 0.2;

    show_debug_message("Estado atual: " + estado);

    // Desconta o tempo real transcorrido
    tempo_restante_inspecao -= delta_time / 1000000;

    // Trava a animação no último quadro
    if (image_index >= image_number - 1) {
        image_speed = 0;
        image_index = image_number - 1;
    }

    // Retorna automaticamente quando o tempo acabar
    if (tempo_restante_inspecao <= 0) {
        estado = "ANDANDO";
    }

	break;
}