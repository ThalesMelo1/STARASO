// Intervalo entre as gerações após o primeiro recurso.
intervalo_minimo = 3;
intervalo_maximo = 6;

// Agenda a primeira geração para daqui a 10 segundos.
// O alarme conta Steps, então multiplicamos os segundos pela
// quantidade de Steps por segundo configurada no jogo.
var _atraso_inicial = 10;
alarm[0] = round(_atraso_inicial * game_get_speed(gamespeed_fps));