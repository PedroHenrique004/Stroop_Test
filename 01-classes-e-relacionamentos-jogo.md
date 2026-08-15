# Classes e Arquitetura — Jogo de Cores (Stroop Test) para Apple Watch

## 1. Entidades principais (Models)

### GameColor (Dado estático)
Representa uma das 12 cores fixas usadas no jogo. Ficam armazenadas em uma estrutura estática `Colors`.
- `id`: Identificador numérico da cor
- `name`: Nome da cor em português (ex: "Vermelho")
- `color`: Valor nativo `Color` do SwiftUI para renderização

### HighScore (Persistido via SwiftData)
Guarda o recorde pessoal do jogador. Anotado com a macro `@Model` nativa da Apple.
- `bestScore`: Maior pontuação já alcançada
- `achievedAt`: Data em que o recorde foi alcançado

### Round (Sessão Volátil)
Representa o escopo de uma única jogada/rodada.
- `difficulty`: Nível de dificuldade (baseado na pontuação atual)
- `roundColors`: Um array com as 4 cores sorteadas
- `wordColor`: A cor da qual será extraído o NOME para o texto
- `rightOption`: A cor da qual será extraída a TINTA (resposta correta)

## 2. Serviços e Lógica Lógica (ViewModels)

Todos os gerenciadores de estado utilizam o padrão moderno `@Observable` do Swift 5.9+.

- **UserState**: Guarda o estado global da partida. Gerencia se o jogo está rodando (`gameIsRunning`) e a pontuação (`score`), sendo injetado no motor do jogo.
- **RoundGenerator**: O gerador lógico. Sorteia 4 cores diferentes da paleta, define independentemente a cor da palavra e a cor correta, e retorna um objeto `Round`.
- **DifficultyManager**: Serviço utilitário estático. Calcula o tempo limite da rodada com base em `Ranges` de acertos (5s → 3s → 2s → 1.5s).
- **RoundTimer**: Controlador síncrono via `Timer`. Deduz `0.1s` por "tick" do loop, garantindo fluidez para a tela. Controla a flag `timeIsOver`.
- **GameEngine**: O Orquestrador. Ele não é uma View. Ele coordena o gerador de rodada, pede o tempo para a dificuldade, manda o timer iniciar, checa se a resposta do botão foi correta, e manipula a pontuação no `UserState`.
- **HighScoreRepository**: Camada de persistência. Recebe o `ModelContext` do SwiftData, varre o HD procurando um recorde com `FetchDescriptor` e faz inserções automáticas (CRUD) sem misturar banco de dados com a UI.

## 3. Arquitetura Visual (Views Modularizadas)

A interface do Apple Watch foi construída usando o padrão MVVM integrado e componentes minificados de alta performance:

- **StartGame.swift**: Ponto de entrada com efeitos visuais e o NavigationLink.
- **Game.swift**: Roteador lógico. Ele inicializa os serviços na memória (`UserState` e `GameEngine`) e alterna a tela entre jogatina e Game Over.
- **PlayingView.swift**: Componente isolado responsável por exibir a HUD do jogador (Placar atual e Timer que fica vermelho sob pressão), aplicar o "Stroop Effect" na palavra central e agrupar a grade de botões.
- **ColorButton.swift**: Componente reutilizável do botão colorido com design jateado.
- **GameOverView.swift**: Tela final imersiva com animação, integração direta com SwiftData usando `@Query` para exibir o recorde na tela nativamente, e botão para reiniciar o loop da aplicação.

## 4. Diagrama Textual do Fluxo Completo

```text
[Interface (PlayingView)] ---> Clique num Botão Colorido
          |
          v
[GameEngine.checkAnswer()] --- Verifica com --- [Round.rightOption]
          |
    +-----+-----+
    |           |
 [Acertou]   [Errou]
    |           |
    |           +---> Chama [UserState.endGame()] ---> A tela muda para [GameOverView]
    |                                                            |
    v                                                            v
Adiciona Ponto [UserState]                             [HighScoreRepository] salva no DB
    |                                                            |
Gera Nova [Round] (RoundGenerator)                               v
    |                                                  O @Query da View se atualiza
Pega Tempo (DifficultyManager)
    |
Liga [RoundTimer]
```
