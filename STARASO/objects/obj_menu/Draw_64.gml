// Define a fonte e o alinhamento
draw_set_font(fnt_menu);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Pega o centro da tela
var _x = display_get_gui_width() / 2;
var _y = display_get_gui_height() / 2;
var _espacamento = 80; // Distância vertical entre cada opção

// Desenha o título do jogo um pouco acima do menu
draw_set_color(c_white);
draw_text(_x, _y - 100, "StaRaros");

// Loop para desenhar todas as opções do array
for (var i = 0; i < op_max; i++) {
    // Destaca em amarelo a opção selecionada
    if (index == i) {
        draw_set_color(c_yellow);
    } else {
        draw_set_color(c_white);
    }
    
    // Desenha o texto na tela
    draw_text(_x, _y + (_espacamento * i), opcoes[i]);
}

// Reseta o alinhamento e a cor para não afetar outros objetos do jogo
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);