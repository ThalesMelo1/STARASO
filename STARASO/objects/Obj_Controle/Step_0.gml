// Atualização de inventário para os itens
for (var i = 0; i < array_length(itens_lista); i++) {
    var st = itens_lista[i].struct;
    if (st.possui && !st.ja) {
        global.inventario += st.tamanho;
        st.ja = true;
    }
}

// Limites mínimos
if (global.agua < 0) global.agua = 0;
if (global.inventario < 0) global.inventario = 0;
if (global.comida < 0) global.comida = 0;