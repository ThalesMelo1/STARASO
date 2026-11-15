// --- CONTROLES ---
var tecla_inspecionar = keyboard_check_pressed(vk_space);
var tecla_mudar_direcao = keyboard_check_pressed(vk_left);

// --- CONTROLE DA ANIMAÇÃO DE CAMINHADA ---
if (estado == "ANDANDO") {

    tempo_quadro += delta_time / 1000000;

    if (tempo_quadro >= intervalo_quadro) {

        tempo_quadro = 0;
        sprite_caminhada = !sprite_caminhada;

        if (sprite_caminhada) {
            sprite_index = AndandoLado;
        } else {
            sprite_index = ParadoLado;
        }

        image_index = 0;
    }
}

// --- MÁQUINA DE ESTADOS ---
switch (estado) {

    case "ESPERA":

        sprite_index = ParadoLado;
        image_speed = 0;
        image_index = 0;
        image_xscale = direcao;

        tempo_espera -= 1;

        if (tempo_espera <= 0) {
            estado = "ANDANDO";
            sprite_caminhada = true;
            tempo_quadro = 0;
            sprite_index = AndandoLado;
        }

    break;

    case "ANDANDO":

        image_speed = 0;
        image_xscale = direcao;

        // Muda de direção apenas uma vez
        if (tecla_mudar_direcao && direcao == 1) {

            direcao = -1;
            global.direcao_parallax = -1;
        }

        // Inicia a inspeção
        if (tecla_inspecionar) {

            estado = "INSPECIONANDO";
            image_index = 0;
            tempo_restante_inspecao = tempo_inspecao;
        }

    break;

    case "INSPECIONANDO":

        sprite_index = Interagindo;
        image_speed = 0.2;
        image_xscale = direcao;

        tempo_restante_inspecao -= delta_time / 1000000;

        // Trava no último quadro da animação
        if (image_index >= image_number - 1) {

            image_speed = 0;
            image_index = image_number - 1;
        }

        // Retorna à caminhada quando terminar
        if (tempo_restante_inspecao <= 0) {

            estado = "ANDANDO";
            sprite_caminhada = true;
            tempo_quadro = 0;
            image_index = 0;
            sprite_index = AndandoLado;
        }

    break;
}