# STARASO

Protótipo de jogo 2D com temática espacial desenvolvido em **GameMaker**. A versão atual apresenta o menu inicial e a transição para a sala de inventário. Na tela de abertura, o título aparece como **StaRaros**.

[![GameMaker](https://img.shields.io/badge/Engine-GameMaker-20252B?style=flat-square&logo=gamemaker&logoColor=white)](https://gamemaker.io/)
[![GML](https://img.shields.io/badge/Linguagem-GameMaker%20Language-3D5570?style=flat-square)](https://manual.gamemaker.io/)
[![Windows](https://img.shields.io/badge/Alvo-Windows-0078D4?style=flat-square)](#executar-localmente)

## O que já está implementado

- Menu inicial com as opções **Jogar** e **Sair**, navegação circular e destaque visual da seleção.
- Transição de **Jogar** para a sala `terra`, onde fica o inventário.
- Recursos gráficos para o cenário e o menu, além de sprites de astronauta armazenados em `Assests/`.

## Executar localmente

1. Instale o [GameMaker](https://gamemaker.io/en/download). A versão da IDE registrada no projeto é **2026.0.0.16**.
2. Clone o repositório.

   ```bash
   git clone https://github.com/ThalesMelo1/STARASO.git
   cd STARASO
   ```

3. No GameMaker, abra [`STARASO/STARASO.yyp`](STARASO/STARASO.yyp).
4. Selecione **Windows** como alvo local e clique em **Run**. O jogo inicia na sala `rm_menu`.

## Controles do menu

| Tecla | Ação |
|---|---|
| **↑** ou **W** | Selecionar a opção anterior |
| **↓** ou **S** | Selecionar a próxima opção |
| **Enter** ou **Espaço** | Confirmar a seleção |

## Estrutura do repositório

| Caminho | Conteúdo |
|---|---|
| [`STARASO/STARASO.yyp`](STARASO/STARASO.yyp) | Arquivo principal do projeto GameMaker. |
| [`STARASO/objects/obj_menu/`](STARASO/objects/obj_menu/) | Eventos GML que inicializam, desenham e controlam o menu. |
| [`STARASO/rooms/`](STARASO/rooms/) | Sala inicial `rm_menu`, inventário `terra`, cenário `planeta` e sala de testes `Teste`. |
| [`STARASO/sprites/`](STARASO/sprites/), [`fonts/`](STARASO/fonts/) e [`tilesets/`](STARASO/tilesets/) | Recursos visuais registrados no GameMaker. |
| [`Assests/`](Assests/) | Arquivos de imagem do projeto, incluindo os quadros do astronauta. |

## Colaborar

Use as [Issues](https://github.com/ThalesMelo1/STARASO/issues) para relatar problemas ou sugerir melhorias. Em propostas de alteração, descreva a cena ou o recurso afetado e como testar o comportamento no GameMaker.
