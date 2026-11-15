var camera_id = view_camera[0];

var cam_x = camera_get_view_x(camera_id);
var cam_y = camera_get_view_y(camera_id);

var largura = camera_get_view_width(camera_id);
var altura = camera_get_view_height(camera_id);

var tile_w = sprite_get_width(sprite_index);
var tile_h = sprite_get_height(sprite_index);

// Desenha o background preenchendo toda a câmera
for (var xx = 0; xx < ceil(largura / tile_w) + 1; xx++) {
    for (var yy = 0; yy < ceil(altura / tile_h) + 1; yy++) {
        draw_sprite(
            sprite_index,
            0,
            cam_x + xx * tile_w,
            cam_y + yy * tile_h
        );
    }
}