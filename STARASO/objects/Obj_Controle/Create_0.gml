global.inventario = 0;
global.inventario_max = 10;
global.agua = 0;
global.comida = 0;
global.dinheiro = 50; // Aumentado para testes

// Controle de qual item está aberto no Pop-up (noone = nenhum)
item_selecionado = noone;

// Estruturas dos itens com descrição e sprite
global.filtro_agua = { possui: false, tamanho: 3, preco: 15, ja: false, desc: "Filtra agua poluida para consumo seguro.", sprite: spr_mockup };
global.computador_ia = { possui: false, tamanho: 3, preco: 25, ja: false, desc: "Processa dados complexos da base.", sprite: spr_mockup };
global.rastreador    = { possui: false, tamanho: 2, preco: 10, ja: false, desc: "Rastreia recursos pelo mapa.", sprite: spr_mockup };
global.motor         = { possui: false, tamanho: 4, preco: 40, ja: false, desc: "Aumenta a velocidade dos sistemas.", sprite: spr_mockup };
global.extrator      = { possui: false, tamanho: 3, preco: 30, ja: false, desc: "Extrai minerios valiosos.", sprite: spr_mockup };

// Lista para iteração
itens_lista = [
    { nome: "Filtro de Agua", struct: global.filtro_agua },
    { nome: "Computador IA",  struct: global.computador_ia },
    { nome: "Rastreador",     struct: global.rastreador },
    { nome: "Motor",          struct: global.motor },
    { nome: "Extrator",       struct: global.extrator }
];