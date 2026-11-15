 // Navegação para cima e para baixo Menu

var _cima = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
var _baixo = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
var _confirmar = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);

if (_baixo) {
    index++;
    if (index >= op_max) index = 0; // Volta para o topo
	show_debug_message("Index atual: " + string(index));
}

if (_cima) {
    index--;
    if (index < 0) index = op_max - 1; // Vai para o final
	show_debug_message("Index atual: " + string(index));
}

if (_confirmar) {
	switch (index) {
		case 0:
			room_goto(Teste);
			break;
		case 1:
			room_goto(terra);
			break;
		case 2:
			room_goto(planeta);
			break;
		case 3:
			game_end();
			break;
	}
}