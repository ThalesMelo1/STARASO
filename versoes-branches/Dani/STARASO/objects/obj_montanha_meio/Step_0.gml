if (tempo_inicio > 0) {
    tempo_inicio -= delta_time / 1000000;
    exit;
}

// O parallax só começa depois de 3 segundos
deslocamento_auto +=
    velocidade_parallax *
    global.direcao_parallax *
    (delta_time / 1000000);