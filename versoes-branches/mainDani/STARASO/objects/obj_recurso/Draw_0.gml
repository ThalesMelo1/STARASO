// Marcadores temporarios de agua, comida e informacao.
var _cor_anterior = draw_get_color();
var _cor = c_yellow;
if (tipo_recurso == "agua") _cor = c_aqua;
if (tipo_recurso == "comida") _cor = c_lime;
draw_set_color(_cor);
draw_circle(x, y, 6, false);
draw_set_color(_cor_anterior);
