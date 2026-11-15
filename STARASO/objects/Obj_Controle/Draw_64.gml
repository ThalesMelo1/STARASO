var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

var painel_w = 1000;
var painel_h = 300;
var px = (gui_w - painel_w) / 2;
var py = (gui_h - painel_h) / 2;

var coluna_dir = px + 500;

// === PAINEL PRINCIPAL ===
draw_set_color(make_color_rgb(30, 30, 40));
draw_rectangle(px, py, px + painel_w, py + painel_h, false);
draw_set_color(c_white);
draw_rectangle(px, py, px + painel_w, py + painel_h, true);

draw_text(px + 20, py + 20, "INVENTARIO");

// Barra de Capacidade
draw_text(px + 20, py + 70, "Capacidade");
draw_set_color(c_black);
draw_rectangle(px + 20, py + 110, px + 320, py + 140, false);

var p = global.inventario / global.inventario_max;
draw_set_color(c_lime);
draw_rectangle(px + 20, py + 110, px + 20 + (300 * p), py + 140, false);
draw_set_color(c_white);
draw_text(px + 340, py + 105, string(global.inventario) + "/" + string(global.inventario_max));

// Recursos
draw_text(px + 20, py + 180, "Agua: " + string(global.agua));
draw_sprite(btn_sprt, 0, px + 250, py + 175);
draw_text(px + 268, py + 185, "+");
draw_sprite(btn_sprt, 0, px + 320, py + 175);
draw_text(px + 340, py + 185, "-");

draw_text(px + 20, py + 250, "Comida: " + string(global.comida));
draw_sprite(btn_sprt, 0, px + 250, py + 245);
draw_text(px + 268, py + 255, "+");
draw_sprite(btn_sprt, 0, px + 320, py + 245);
draw_text(px + 340, py + 255, "-");

// Coluna de Itens
draw_text(coluna_dir, py + 20, "ITENS");
var btn_x = px + painel_w - 70;
var y_base = py + 60;
var espacamento = 35;

for (var i = 0; i < array_length(itens_lista); i++) {
    var item = itens_lista[i];
    var item_y = y_base + (i * espacamento);
    
    var status_str = item.struct.possui ? "[X] " : "[ ] ";
    draw_text(coluna_dir, item_y, status_str + item.nome);
    
    // Botão de Detalhes (...) ou (+)
    if (!item.struct.possui) {
        draw_sprite(btn_sprt, 0, btn_x, item_y - 5);
        draw_text(btn_x + 18, item_y, "+");
    }
}

draw_text(coluna_dir, py + 250, "Dinheiro: " + string(global.dinheiro));


// =========================================================
// JANELA POP-UP (Desenha se um item for selecionado)
// =========================================================
if (item_selecionado != noone) {
    // Escurecer o fundo
    draw_set_color(c_black);
    draw_set_alpha(0.6);
    draw_rectangle(0, 0, gui_w, gui_h, false);
    draw_set_alpha(1.0); // Reseta transparência

    // Dimensões do Pop-up
    var pop_w = 450;
    var pop_h = 280;
    var pop_x = (gui_w - pop_w) / 2;
    var pop_y = (gui_h - pop_h) / 2;

    // Caixa da Janela
    draw_set_color(make_color_rgb(40, 40, 55));
    draw_rectangle(pop_x, pop_y, pop_x + pop_w, pop_y + pop_h, false);
    draw_set_color(c_white);
    draw_rectangle(pop_x, pop_y, pop_x + pop_w, pop_y + pop_h, true);

    // Botão fechar (X)
    draw_set_color(c_red);
    draw_rectangle(pop_x + pop_w - 30, pop_y + 10, pop_x + pop_w - 10, pop_y + 30, false);
    draw_set_color(c_white);
    draw_text(pop_x + pop_w - 24, pop_y + 12, "X");

    // Informações do Item
    var st = item_selecionado.struct;
    
    // Nome do Item
    draw_text(pop_x + 20, pop_y + 20, item_selecionado.nome);
    
    // Desenhar Foto/Sprite do Item (se existir a sprite)
    if (sprite_exists(st.sprite)) {
        draw_sprite(st.sprite, 0, pop_x + 30, pop_y + 60);
    } else {
        // Placeholder se a sprite ainda não existir
        draw_set_color(c_dkgray);
        draw_rectangle(pop_x + 20, pop_y + 60, pop_x + 100, pop_y + 140, false);
        draw_set_color(c_white);
        draw_text(pop_x + 35, pop_y + 90, "FOTO");
    }

    // Detalhes do Item
    draw_text(pop_x + 130, pop_y + 60, "Preco: $" + string(st.preco));
    draw_text(pop_x + 130, pop_y + 90, "Tamanho: " + string(st.tamanho) + " slots");
    
    // Descrição (usando draw_text_ext para quebrar linha se for grande)
    draw_text_ext(pop_x + 20, pop_y + 160, st.desc, 20, pop_w - 40);

    // Botão COMPRAR
    var btn_buy_x1 = pop_x + (pop_w / 2) - 60;
    var btn_buy_y1 = pop_y + pop_h - 45;
    var btn_buy_x2 = btn_buy_x1 + 120;
    var btn_buy_y2 = btn_buy_y1 + 35;

    // Altera cor do botão de compra se tiver dinheiro suficiente
    if (global.dinheiro >= st.preco) {
        draw_set_color(c_green);
    } else {
        draw_set_color(c_gray);
    }
    
    draw_rectangle(btn_buy_x1, btn_buy_y1, btn_buy_x2, btn_buy_y2, false);
    draw_set_color(c_white);
    draw_text(btn_buy_x1 + 25, btn_buy_y1 + 8, "COMPRAR");
}