// Pega o mouse na GUI
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Painel central
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

var painel_w = 1000;
var painel_h = 300;

var px = (gui_w - painel_w) / 2;
var py = (gui_h - painel_h) / 2;

var btn_x1 = px + painel_w - 70;
var btn_x2 = px + painel_w - 20;
// ===================================
// ÁGUA +
// ===================================
if point_in_rectangle(

    mx, my,
    px + 250, py + 175,
    px + 300, py + 225
) && global.inventario < global.inventario_max
{
    global.agua += 20;
	global.inventario += 1;
}


// ===================================
// ÁGUA -
// ===================================
if point_in_rectangle(
    mx, my,
    px + 320, py + 175,
    px + 370, py + 225
)
{
    global.agua -= 20;
	if (global.agua >= 0){
	global.inventario -=1; }
}


// ===================================
// COMIDA +
// ===================================
if point_in_rectangle(
    mx, my,
    px + 250, py + 245,
    px + 300, py + 295
) && global.inventario < global.inventario_max
{
    global.comida += 20;
	global.inventario += 1;
}


// ===================================
// COMIDA -
// ===================================
if point_in_rectangle(
    mx, my,
    px + 320, py + 245,
    px + 370, py + 295
)
{
    global.comida -= 20;
	if (global.comida >= 0){
	global.inventario -= 1; }
}


// ===================================
// LIMITES
// ===================================
global.agua = clamp(global.agua, 0, 999);
global.comida = clamp(global.comida, 0, 999);

var comprar_item = function(_item) {
    if (_item.possui || global.dinheiro < _item.preco ||
        global.inventario + _item.tamanho > global.inventario_max) {
        return;
    }

    _item.possui = true;
    global.dinheiro -= _item.preco;
    global.inventario += _item.tamanho;
};

//Itens


// FILTRO
if point_in_rectangle(
    mx, my,
    btn_x1, py + 55,
    btn_x2, py + 85
)
{
    comprar_item(global.filtro_agua);
}

// IA
if point_in_rectangle(
    mx, my,
    btn_x1, py + 100,
    btn_x2, py + 130
)
{
    comprar_item(global.computador_ia);
}

// RASTREADOR
if point_in_rectangle(
    mx, my,
    btn_x1, py + 145,
    btn_x2, py + 175
)
{
    comprar_item(global.rastreador);
}

// MOTOR
if point_in_rectangle(
    mx, my,
    btn_x1, py + 190,
    btn_x2, py + 220
)
{
    comprar_item(global.motor);
}

// EXTRATOR
if point_in_rectangle(
    mx, my,
    btn_x1, py + 235,
    btn_x2, py + 265
)
{
    comprar_item(global.extrator);
}