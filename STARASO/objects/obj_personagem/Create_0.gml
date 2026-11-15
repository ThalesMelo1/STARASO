// --- ESTADOS E VELOCIDADE ---
estado = "ESPERA"; // Começa no modo de espera

tempo_inspecao = 2.0; 
tempo_restante_inspecao = 0;

// --- TEMPORIZADOR DE ESPERA (3 segundos) ---
tempo_espera = 60 * 3; 

// --- SPRITES ---
spr_andar = AndandoLado; 
spr_parado = ParadoLado; 
spr_interagindo = Interagindo;

// Começa com o sprite parado e animação travada
sprite_index = ParadoLado;
image_speed = 0;