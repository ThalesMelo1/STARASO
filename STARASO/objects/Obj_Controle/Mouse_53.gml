var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

var spr_w = sprite_get_width(btn_sprt);
var spr_h = sprite_get_height(btn_sprt);

// =========================================
// CONTROLE DE CLIQUE COM POP-UP ABERTO
// =========================================
if (item_selecionado != noone) {
    var pop_w = 500;
    var pop_h = 400;
    var pop_x = (gui_w - pop_w) / 2;
    var pop_y = (gui_h - pop_h) / 2;

    // 1. Fechar (X)
    var close_btn_x = pop_x + pop_w - 45;
    var close_btn_y = pop_y + 15;
    if (point_in_rectangle(mx, my, close_btn_x, close_btn_y, close_btn_x + spr_w, close_btn_y + spr_h)) {
        item_selecionado = noone;
        exit;
    }

    // 2. COMPRAR (usando as mesmas escalas 5x5.5)
    var escala_x = 5;
    var escala_y = 5.5;
    var buy_w = spr_w * escala_x;
    var buy_h = spr_h * escala_y;
    var btn_buy_x = pop_x + (pop_w / 2) - (buy_w / 2);
    var btn_buy_y = pop_y + pop_h - 200;

    if (point_in_rectangle(mx, my, btn_buy_x, btn_buy_y, btn_buy_x + buy_w, btn_buy_y + buy_h)) {
        var st = item_selecionado.struct;
        if (!st.possui && global.dinheiro >= st.preco) {
            st.possui = true;
            global.dinheiro -= st.preco;
            item_selecionado = noone;
        }
    }
    
    exit;
}

// =========================================
// CONTROLE DE CLIQUE DA TELA PRINCIPAL
// =========================================
var painel_w = 1000;
var painel_h = 500;
var px = (gui_w - painel_w) / 2;
var py = (gui_h - painel_h) / 2;

// --- ÁGUA (+) ---
if (point_in_rectangle(mx, my, px + 290, py + 175, px + 290 + spr_w, py + 175 + spr_h)) {
    if (global.inventario < global.inventario_max) && (global.dinheiro >= 10) {
        global.agua += 20;
        global.inventario += 1;
        global.dinheiro -= 10;
    }
}

// --- ÁGUA (-) ---
if (point_in_rectangle(mx, my, px + 360, py + 175, px + 360 + spr_w, py + 175 + spr_h)) {
    if (global.agua >= 20) {
        global.agua -= 20;
        global.inventario -= 1;
        global.dinheiro += 10;
    }
}

// --- COMIDA (+) ---
if (point_in_rectangle(mx, my, px + 290, py + 245, px + 290 + spr_w, py + 245 + spr_h)) {
    if (global.inventario < global.inventario_max) && (global.dinheiro >= 15) {
        global.comida += 20;
        global.inventario += 1;
        global.dinheiro -= 15;
    }
}

// --- COMIDA (-) ---
if (point_in_rectangle(mx, my, px + 360, py + 245, px + 360 + spr_w, py + 245 + spr_h)) {
    if (global.comida >= 20) {
        global.comida -= 20;
        global.inventario -= 1;
        global.dinheiro += 15;
    }
}

// --- GASOLINA (+) ---
if (point_in_rectangle(mx, my, px + 340, py + 365, px + 340 + spr_w, py + 365 + spr_h)) {
    if (global.gasolina < global.gasolina_max) && (global.dinheiro >= 20) {
        global.gasolina += 1;
        global.dinheiro -= 20;
    }
}

// Clicar nos botões da lista para ABRIR O POP-UP
var btn_x = px + painel_w - 70;
var y_base = py + 60;
var espacamento = 50;

for (var i = 0; i < array_length(itens_lista); i++) {
    var item_y = y_base + (i * espacamento) - 5;
    var st = itens_lista[i].struct;
    
    if (point_in_rectangle(mx, my, btn_x, item_y, btn_x + spr_w, item_y + spr_h)) {
        if (!st.possui) {
            item_selecionado = itens_lista[i];
        }
    }
}