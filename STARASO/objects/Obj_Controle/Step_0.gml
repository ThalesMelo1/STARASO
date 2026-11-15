if(global.filtro_agua.possui == true) && (global.filtro_agua.ja == false) {
	global.inventario += global.filtro_agua.tamanho;
	global.filtro_agua.ja = true;
}
if(global.computador_ia.possui == true) && (global.computador_ia.ja == false) {
	global.inventario += global.computador_ia.tamanho;
	global.computador_ia.ja = true;
}
if(global.rastreador.possui == true) && (global.rastreador.ja == false) {
	global.inventario += global.rastreador.tamanho;
	global.rastreador.ja = true;
}


// ---------------------

if(global.agua < 0) {
	global.agua = 0;
}
if(global.inventario < 0) {
	global.inventario = 0;
}
if(global.comida < 0) {
	global.comida = 0;
}

