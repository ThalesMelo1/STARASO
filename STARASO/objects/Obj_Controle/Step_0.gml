// Atualização de inventário para os itens
for (var i = 0; i < array_length(itens_lista); i++) {
    var st = itens_lista[i].struct;
    if (st.possui && !st.ja) {
        global.inventario += st.tamanho;
        st.ja = true;
    }
}

// Limites mínimos e máximos
global.agua = clamp(global.agua, 0, 999);
global.comida = clamp(global.comida, 0, 999);
global.inventario = clamp(global.inventario, 0, global.inventario_max);
global.gasolina = clamp(global.gasolina, 0, global.gasolina_max);