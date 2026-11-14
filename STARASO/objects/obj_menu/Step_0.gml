// Navegação para cima e para baixo Menu

var _cima = keyboard_check_pressed(vk_up) || keyboard_check_pressed("W");
var _baixo = keyboard_check_pressed(vk_down) || keyboard_check_pressed("S");
var _confirmar = keyboard_check_pressed(vk_enter);

if(_baixo) {
	index++;
	if(index < 0) index = 0;
}

i(_cima) {
	index--;
	if (index < 0) index = op_max - 1;
}

if (_confirmar) {
	switch (index) {
		case 0:
			room_goto(planeta);
			break;
		case 1:
			game_end();
			break;
	}
}