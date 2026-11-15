if (!inventario_aberto) {
    draw_text_color(20, 20, "[I] Inventory  |  Water: " + string(global.agua)
        + "  |  Food: " + string(global.comida), c_white, c_white, c_white, c_white, 1);
    exit;
}

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

var painel_w = 1000;
var painel_h = 500;
var px = (gui_w - painel_w) / 2;
var py = (gui_h - painel_h) / 2;

var coluna_dir = px + 500;

// Pegar dimensões da sprite base para cálculos de posição
var spr_w = sprite_get_width(btn_sprt);
var spr_h = sprite_get_height(btn_sprt);

// === PAINEL PRINCIPAL ===
draw_set_color(make_color_rgb(30, 30, 40));
draw_rectangle(px, py, px + painel_w, py + painel_h, false);
draw_set_color(c_white);
draw_rectangle(px, py, px + painel_w, py + painel_h, true);

draw_text(px + 20, py + 20, "INVENTORY  [I]");

// Barra de Capacidade
draw_text(px + 20, py + 60, "Capacity");
draw_set_color(c_black);
draw_rectangle(px + 20, py + 110, px + 320, py + 150, false);

var p = global.inventario / global.inventario_max;
draw_set_color(c_lime);
draw_rectangle(px + 20, py + 110, px + 20 + (300 * p), py + 150, false);
draw_set_color(c_white);
draw_text(px + 340, py + 105, string(global.inventario) + "/" + string(global.inventario_max));

// Recursos (Água & Comida)
draw_text(px + 20, py + 180, "$10 | Water: " + string(global.agua));
draw_sprite(btn_sprt, 0, px + 290, py + 175);
draw_text(px + 308, py + 185, "+");
draw_sprite(btn_sprt, 0, px + 360, py + 175);
draw_text(px + 380, py + 185, "-");

draw_text(px + 20, py + 250, "$15 | Food: " + string(global.comida));
draw_sprite(btn_sprt, 0, px + 290, py + 245);
draw_text(px + 308, py + 255, "+");
draw_sprite(btn_sprt, 0, px + 360, py + 245);
draw_text(px + 380, py + 255, "-");

// --- BARRA DE GASOLINA ($20) ---
// 1. Título "Gas | $20"
draw_text(px + 20, py + 310, "Gas | $20");

// 2. Nível de gasolina (abaixo de "Gas" e acima da barra)
draw_set_color(c_white);
draw_text(px + 20, py + 440, "Gas lvl " + string(global.gasolina) + "/" + string(global.gasolina_max));

// 3. Fundo preto da barra (deslocado mais para baixo: py + 370)
draw_set_color(c_black);
draw_rectangle(px + 20, py + 370, px + 320, py + 410, false);

// 4. Preenchimento (Laranja Terroso)
var p_gas = global.gasolina / global.gasolina_max;
draw_set_color(make_color_rgb(180, 80, 20));
draw_rectangle(px + 20, py + 370, px + 20 + (300 * p_gas), py + 410, false);

// 5. Botão + de Gasolina (alinhado ao lado da barra)
draw_sprite(btn_sprt, 0, px + 340, py + 365);
draw_set_color(c_white);
draw_text(px + 358, py + 375, "+");
// Coluna de Itens
draw_text(coluna_dir, py + 20, "ITENS");
var btn_x = px + painel_w - 70;
var y_base = py + 60;
var espacamento = 50;

for (var i = 0; i < array_length(itens_lista); i++) {
    var item = itens_lista[i];
    var item_y = y_base + (i * espacamento);

    var status_str = item.struct.possui ? "[X] " : "[ ] ";
    draw_text(coluna_dir, item_y, status_str + item.nome);

    if (!item.struct.possui) {
        draw_sprite_stretched(btn_sprt, 0, btn_x, item_y - 5, 48, 48);
        draw_text(btn_x + 18, item_y, "+");
    }
}

draw_text(coluna_dir, py + 450, "Money: " + string(global.dinheiro));


// =========================================================
// JANELA POP-UP (500x400)
// =========================================================
if (item_selecionado != noone) {
    // Escurecer o fundo
    draw_set_color(c_black);
    draw_set_alpha(0.6);
    draw_rectangle(0, 0, gui_w, gui_h, false);
    draw_set_alpha(1.0);

    // Dimensões do Pop-up
    var pop_w = 500;
    var pop_h = 400;
    var pop_x = (gui_w - pop_w) / 2;
    var pop_y = (gui_h - pop_h) / 2;

    // Caixa da Janela
    draw_set_color(make_color_rgb(40, 40, 55));
    draw_rectangle(pop_x, pop_y, pop_x + pop_w, pop_y + pop_h, false);
    draw_set_color(c_white);
    draw_rectangle(pop_x, pop_y, pop_x + pop_w, pop_y + pop_h, true);

    // Botão Fechar (X)
    var close_btn_x = pop_x + pop_w - 45;
    var close_btn_y = pop_y + 15;
    draw_sprite(btn_sprt, 0, close_btn_x, close_btn_y);
    draw_set_color(c_white);
    draw_text(close_btn_x + 19, close_btn_y + 8, "X");

    var st = item_selecionado.struct;

    // Título do Item
    draw_text(pop_x + 30, pop_y + 25, item_selecionado.nome);

    // Foto maior
    if (sprite_exists(st.sprite)) {
        var photo_scale = min(100 / sprite_get_width(st.sprite), 100 / sprite_get_height(st.sprite));
        draw_sprite_ext(st.sprite, 0, pop_x + 30, pop_y + 70, photo_scale, photo_scale, 0, c_white, 1);
    } else {
        draw_set_color(c_dkgray);
        draw_rectangle(pop_x + 30, pop_y + 70, pop_x + 130, pop_y + 170, false);
        draw_set_color(c_white);
        draw_text(pop_x + 50, pop_y + 110, "FOTO");
    }

    // Detalhes
    draw_text(pop_x + 160, pop_y + 75, "Price: $" + string(st.preco));
    draw_text(pop_x + 160, pop_y + 115, "Size: " + string(st.tamanho) + " slots");

    // Descrição
    draw_text_ext(pop_x + 20, pop_y + 220, st.desc, 33, pop_w - 40);

    // === BOTÃO COMPRAR ===
    var buy_w = 200;
    var buy_h = 56;


    var btn_buy_x = pop_x + (pop_w / 2) - (buy_w / 2);
    var btn_buy_y = pop_y + pop_h - buy_h - 16;


    if (global.dinheiro >= st.preco && global.inventario + st.tamanho <= global.inventario_max) {
        draw_sprite_stretched_ext(btn2_sprt, 0, btn_buy_x, btn_buy_y, buy_w, buy_h, c_white, 1);
    } else {
        draw_sprite_stretched_ext(btn2_sprt, 0, btn_buy_x, btn_buy_y, buy_w, buy_h, c_gray, 1);
    }

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_text(btn_buy_x + (buy_w / 2), btn_buy_y + (buy_h / 2), "BUY");

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
