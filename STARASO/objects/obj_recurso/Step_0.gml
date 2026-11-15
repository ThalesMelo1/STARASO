// Procura o personagem e limita o movimento a distancia restante.
var _alvo = instance_nearest(x, y, obj_personagem);
if (_alvo == noone) exit;
var _distancia = point_distance(x, y, _alvo.x, _alvo.y);
if (_distancia > raio_coleta) {
    var _angulo = point_direction(x, y, _alvo.x, _alvo.y);
    var _passo = min(velocidade_recurso, _distancia);
    x += lengthdir_x(_passo, _angulo);
    y += lengthdir_y(_passo, _angulo);
}
if (point_distance(x, y, _alvo.x, _alvo.y) > raio_coleta) exit;

// Entrega o recurso e remove a instancia apos a coleta.
switch (tipo_recurso) {
    case "agua":
        // Um lote de 20 unidades ocupa um slot, como na loja.
        if (global.inventario >= global.inventario_max) exit;
        global.agua += 20;
        global.inventario += 1;
        break;
    case "comida":
        // Um lote de 20 unidades ocupa um slot, como na loja.
        if (global.inventario >= global.inventario_max) exit;
        global.comida += 20;
        global.inventario += 1;
        break;
    case "informacao": show_message("Informacao encontrada!"); break;
    default: exit;
}
instance_destroy();
