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
    var pop_w = 450;
    var pop_h = 280;
    var pop_x = (gui_w - pop_w) / 2;
    var pop_y = (gui_h - pop_h) / 2;

    // 1. Clicar no Fechar (X)
    if (point_in_rectangle(mx, my, pop_x + pop_w - 30, pop_y + 10, pop_x + pop_w - 10, pop_y + 30)) {
        item_selecionado = noone;
        exit;
    }

    // 2. Clicar em COMPRAR
    var btn_buy_x1 = pop_x + (pop_w / 2) - 60;
    var btn_buy_y1 = pop_y + pop_h - 45;
    var btn_buy_x2 = btn_buy_x1 + 120;
    var btn_buy_y2 = btn_buy_y1 + 35;

    if (point_in_rectangle(mx, my, btn_buy_x1, btn_buy_y1, btn_buy_x2, btn_buy_y2)) {
        var st = item_selecionado.struct;
        
        // Valida se tem dinheiro suficiente
        if (!st.possui && global.dinheiro >= st.preco && global.inventario + st.tamanho <= global.inventario_max) {
            st.possui = true;
            global.dinheiro -= st.preco;
            item_selecionado = noone; // Fecha a janela após comprar
        }
    }
    
    // Impede que o clique passe para os botões de trás se clicar fora
    exit;
}

// =========================================
// CONTROLE DE CLIQUE DA TELA PRINCIPAL
// =========================================
var painel_w = 1000;
var painel_h = 300;
var px = (gui_w - painel_w) / 2;
var py = (gui_h - painel_h) / 2;

// Botões Água/Comida
if (point_in_rectangle(mx, my, px + 250, py + 175, px + 250 + spr_w, py + 175 + spr_h)) {
    if (global.inventario < global.inventario_max) { global.agua += 20; global.inventario += 1; }
}
if (point_in_rectangle(mx, my, px + 320, py + 175, px + 320 + spr_w, py + 175 + spr_h)) {
    if (global.agua >= 20) { global.agua -= 20; global.inventario -= 1; }
}
if (point_in_rectangle(mx, my, px + 250, py + 245, px + 250 + spr_w, py + 245 + spr_h)) {
    if (global.inventario < global.inventario_max) { global.comida += 20; global.inventario += 1; }
}
if (point_in_rectangle(mx, my, px + 320, py + 245, px + 320 + spr_w, py + 245 + spr_h)) {
    if (global.comida >= 20) { global.comida -= 20; global.inventario -= 1; }
}

global.agua = clamp(global.agua, 0, 999);
global.comida = clamp(global.comida, 0, 999);

// Clicar nos botões da lista para ABRIR O POP-UP
var btn_x = px + painel_w - 70;
var y_base = py + 60;
var espacamento = 35;

for (var i = 0; i < array_length(itens_lista); i++) {
    var item_y = y_base + (i * espacamento) - 5;
    var st = itens_lista[i].struct;
    
    if (point_in_rectangle(mx, my, btn_x, item_y, btn_x + 32, item_y + 32)) {
        if (!st.possui) {
            item_selecionado = itens_lista[i]; // Abre a janela do item!
            break;        }
    }
}