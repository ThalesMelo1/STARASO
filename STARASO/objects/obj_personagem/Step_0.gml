// --- CONTROLES ---
var tecla_inspecionar = keyboard_check_pressed(vk_space);
var tecla_voltar = keyboard_check(vk_left);

// --- MÁQUINA DE ESTADOS ---
switch (estado) {
    
    case "ESPERA":
        // Mantém o sprite parado durante a contagem
        sprite_index = ParadoLado;
        image_speed = 0;
        
        // Reduz o tempo a cada frame
        tempo_espera -= 1;
        
        // Quando o tempo acabar, muda para o estado de andar
        if (tempo_espera <= 0) {
            estado = "ANDANDO";
        }
    break;

    case "ANDANDO":
        // Move o personagem para a frente
        x += velocidade;
        
        // Aplica o sprite de andar e garante que olha para a direita
        sprite_index = AndandoLado;
        image_xscale = 1; 
        image_speed = 0.2; // Velocidade da animação dos 2 quadros
        
        // Transições
        if (tecla_inspecionar) {
            estado = "INSPECIONANDO";
        } else if (tecla_voltar) {
            estado = "VOLTANDO";
        }
    break;

    case "VOLTANDO":
        // Move o personagem para trás
        x -= velocidade;
        
        // Usa o mesmo sprite de andar, mas espelhado para a esquerda
        sprite_index = AndandoLado;
        image_xscale = -1; 
        image_speed = 0.2;
        
        // Se soltar a tecla esquerda, volta a andar para frente
        if (!tecla_voltar) {
            estado = "ANDANDO";
        }
        // Permite inspecionar mesmo andando para trás
        if (tecla_inspecionar) {
            estado = "INSPECIONANDO";
        }
    break;

    case "INSPECIONANDO":
        // Troca para o sprite parado
        sprite_index = Interagindo;
        
        // Define a velocidade da animação (0.1 ou 0.15 para não ficar rápido demais)
        image_speed = 0.2; 
        
        // Se quiser que a animação de 2 quadros pare no último quadro e não fique loopando infinitamente:
        if (image_index >= image_number - 1) {
            image_speed = 0; // Trava no último quadro
            image_index = image_number - 1;
        }
        
        // Aperta espaço novamente para sair da inspeção e voltar a andar
        if (tecla_inspecionar) {
            estado = "ANDANDO";
        }
		break;
}