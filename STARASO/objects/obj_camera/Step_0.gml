if (instance_exists(obj_personagem)) {

    var camera_x = obj_personagem.x - 240;
    var camera_y = obj_personagem.y - 335;

    camera_set_view_pos(camera_id, camera_x, camera_y);

}