// Sorteia um tipo a cada geração. Tipos podem se repetir.
var _tipo = choose("agua", "comida", "informacao");

// Cria uma única instância na posição e na camada do gerador.
// O Step de obj_recurso cuida de seguir o personagem e da coleta.
var _recurso = instance_create_layer(x, y, layer, obj_recurso);
_recurso.tipo_recurso = _tipo;

// Rearma o mesmo alarme para que o gerador continue funcionando.
var _segundos = random_range(intervalo_minimo, intervalo_maximo);
alarm[0] = max(1, round(_segundos * game_get_speed(gamespeed_fps)));