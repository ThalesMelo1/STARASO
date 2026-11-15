if (keyboard_check_pressed(ord("I"))) {
    inventario_aberto = !inventario_aberto;
    item_selecionado = noone;
}

// Limites mínimos e máximos
global.agua = clamp(global.agua, 0, 999);
global.comida = clamp(global.comida, 0, 999);
global.inventario = clamp(global.inventario, 0, global.inventario_max);
global.gasolina = clamp(global.gasolina, 0, global.gasolina_max);
