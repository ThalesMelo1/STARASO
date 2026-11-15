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
    if (global.agua >= 20) {
        global.agua -= 20;
        global.inventario -= 1;
    }
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
    if (global.comida >= 20) {
        global.comida -= 20;
        global.inventario -= 1;
    }
}


// ===================================
// LIMITES
// ===================================
global.agua = clamp(global.agua, 0, 999);
global.comida = clamp(global.comida, 0, 999);

//Itens


// FILTRO
if point_in_rectangle(
    mx, my,
    btn_x1, py + 55,
    btn_x2, py + 85
) && (global.dinheiro >= global.filtro_agua.preco)
{
    global.filtro_agua.possui = true;
	global.dinheiro -= global.filtro_agua.preco;
	
}

// IA
if point_in_rectangle(
    mx, my,
    btn_x1, py + 100,
    btn_x2, py + 130
)
{
    global.computador_ia.possui = true;
}

// RASTREADOR
if point_in_rectangle(
    mx, my,
    btn_x1, py + 145,
    btn_x2, py + 175
)
{
    global.rastreador.possui = true;
}

// MOTOR
if point_in_rectangle(
    mx, my,
    btn_x1, py + 190,
    btn_x2, py + 220
)
{
    global.motor.possui = true;
}

// EXTRATOR
if point_in_rectangle(
    mx, my,
    btn_x1, py + 235,
    btn_x2, py + 265
)
{
    global.extrator.possui = true;
}