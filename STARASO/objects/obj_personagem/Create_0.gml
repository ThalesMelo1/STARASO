// --- ESTADOS E VELOCIDADE ---
estado = "ESPERA"; // Começa no modo de espera
velocidade = 2;

// --- TEMPORIZADOR DE ESPERA (3 segundos) ---
// Como o GameMaker roda a 60 FPS por padrão, 60 * 3 = 180 frames
tempo_espera = 60 * 3; 

// --- SPRITES ---
spr_andar = AndandoLado; // O sprite de 2 quadros andando
spr_parado = ParadoLado; // O sprite de 1 quadro (ou parado)
spr_interagindo = Interagindo;

// Começa com o sprite parado e animação travada
sprite_index = ParadoLado;
image_speed = 0;