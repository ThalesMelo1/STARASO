// Draw GUI

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

var painel_w = 1000;
var painel_h = 300;

var px = (gui_w - painel_w) / 2;
var py = (gui_h - painel_h) / 2;

var coluna_dir = px + 500;


var px = (gui_w - painel_w) / 2;
var py = (gui_h - painel_h) / 2;

// Fundo
draw_set_color(make_color_rgb(30,30,40));
draw_rectangle(px, py, px+painel_w, py+painel_h, false);

// Borda
draw_set_color(c_white);
draw_rectangle(px, py, px+painel_w, py+painel_h, true);

// Título
draw_text(px + 20, py + 20, "INVENTARIO");

// INVENTÁRIO
draw_text(px + 20, py + 70, "Capacidade");

draw_set_color(c_black);
draw_rectangle(px+20, py+110, px+320, py+140, false);

var p = global.inventario / global.inventario_max;

draw_set_color(c_lime);
draw_rectangle(
    px+20,
    py+110,
    px+20 + (300*p),
    py+140,
    false
);

draw_text(
    px+340,
    py+105,
    string(global.inventario) + "/" + string(global.inventario_max)
);

//AGUA
draw_text(px + 20, py + 180,
          "Agua: " + string(global.agua));

// +
draw_set_color(c_green);
draw_rectangle(px+250, py+175,
               px+300, py+225, false);

draw_set_color(c_white);
draw_text(px+268, py+185, "+");

// -
draw_set_color(c_red);
draw_rectangle(px+320, py+175,
               px+370, py+225, false);

draw_set_color(c_white);
draw_text(px+340, py+185, "-");

//COMIDA
draw_text(px + 20, py + 250,
          "Comida: " + string(global.comida));

// +
draw_set_color(c_green);
draw_rectangle(px+250, py+245,
               px+300, py+295, false);

draw_set_color(c_white);
draw_text(px+268, py+255, "+");

// -
draw_set_color(c_red);
draw_rectangle(px+320, py+245,
               px+370, py+295, false);

draw_set_color(c_white);
draw_text(px+340, py+255, "-");

// ITENS

draw_text(coluna_dir, py + 20, "ITENS");

draw_text(coluna_dir, py + 60,
          "[ ] Filtro de Agua");

draw_text(coluna_dir, py + 95,
          "[ ] Computador IA");

draw_text(coluna_dir, py + 130,
          "[ ] Rastreador");

draw_text(coluna_dir, py + 165,
          "[ ] Motor");

draw_text(coluna_dir, py + 200,
          "[ ] Extrator");
		  
draw_text(coluna_dir, py + 250,
          "Dinheiro: " + string(global.dinheiro));
		  
		  
draw_set_color(c_blue);

// ======================================
// BOTOES DOS ITENS
// ======================================

var btn_x1 = px + painel_w - 70;
var btn_x2 = px + painel_w - 20;

// Filtro
draw_set_color(c_blue);
draw_rectangle(btn_x1, py + 55,
               btn_x2, py + 85, false);

draw_set_color(c_white);
draw_text(btn_x1 + 18, py + 60, "+");


// IA
draw_set_color(c_blue);
draw_rectangle(btn_x1, py + 100,
               btn_x2, py + 130, false);

draw_set_color(c_white);
draw_text(btn_x1 + 18, py + 105, "+");


// Rastreador
draw_set_color(c_blue);
draw_rectangle(btn_x1, py + 145,
               btn_x2, py + 175, false);

draw_set_color(c_white);
draw_text(btn_x1 + 18, py + 150, "+");


// Motor
draw_set_color(c_blue);
draw_rectangle(btn_x1, py + 190,
               btn_x2, py + 220, false);

draw_set_color(c_white);
draw_text(btn_x1 + 18, py + 195, "+");


// Extrator
draw_set_color(c_blue);
draw_rectangle(btn_x1, py + 235,
               btn_x2, py + 265, false);

draw_set_color(c_white);
draw_text(btn_x1 + 18, py + 240, "+");