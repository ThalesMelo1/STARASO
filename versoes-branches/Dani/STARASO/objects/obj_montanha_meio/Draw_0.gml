var camera_id = view_camera[0];

var cam_x = camera_get_view_x(camera_id);
var cam_y = camera_get_view_y(camera_id);

var largura = camera_get_view_width(camera_id);
var altura = camera_get_view_height(camera_id);

// Dimensões do sprite
var tile_w = sprite_get_width(sprite_index);
var tile_h = sprite_get_height(sprite_index);

// Calcula o deslocamento combinado
var deslocamento = (
    cam_x * fator_parallax + deslocamento_auto
) mod tile_w;

// Posição inicial
var inicio_x = cam_x - deslocamento - tile_w;

// Posicionamento vertical
var pos_y = cam_y + altura - tile_h;

// Quantidade de repetições
var quantidade = ceil(largura / tile_w) + 2;

// Desenha as montanhas
for (var i = 0; i < quantidade; i++) {

    draw_sprite(
        sprite_index,
        0,
        inicio_x + (i * tile_w),
        pos_y
    );

}