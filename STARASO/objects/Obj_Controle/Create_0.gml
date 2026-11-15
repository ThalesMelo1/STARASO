global.inventario = 0;
global.inventario_max = 10;
global.agua = 0;
global.comida = 0;
global.dinheiro = 50;
global.gasolina = 5;
global.gasolina_max = 10;

item_selecionado = noone;

// Estruturas corrigidas
global.filtro_agua   = { possui: false, tamanho: 3, preco: 15, desc: "Filters polluted water for safe consumption", sprite: spr_filtroAgua };
global.computador_ia = { possui: false, tamanho: 3, preco: 25, desc: "Processa dados complexos da base.", sprite: spr_computadorIA };
global.rastreador    = { possui: false, tamanho: 2, preco: 10, desc: "Rastreia recursos pelo mapa.", sprite: spr_rastreadorMetais };
global.motor         = { possui: false, tamanho: 4, preco: 40, desc: "Aumenta a velocidade dos sistemas.", sprite: spr_motor };
global.extrator      = { possui: false, tamanho: 3, preco: 30, desc: "Extrai minerios valiosos.", sprite: spr_extratorAgua };

itens_lista = [
    { nome: "Water Filter", struct: global.filtro_agua },
    { nome: "IA Computer",  struct: global.computador_ia },
    { nome: "Tracker",     struct: global.rastreador },
    { nome: "Motor",          struct: global.motor },
    { nome: "Extractor",       struct: global.extrator }
];
