# Requisitos — Jogo de Cores (Stroop Test) para Apple Watch (v1)

## 1. Requisitos Funcionais

| ID | Descrição |
|---|---|
| RF01 | O app deve exibir 4 opções de cor (quadrados/áreas de toque) sorteadas aleatoriamente entre uma paleta fixa de 12 cores, a cada rodada. |
| RF02 | O app deve exibir uma palavra central cujo nome corresponde a uma das 4 cores sorteadas na rodada, escolhida aleatoriamente entre essas 4 (podendo coincidir ou não com a cor certa). |
| RF03 | O app deve pintar a palavra central com a cor definida como "certa" da rodada — a cor que o jogador deve tocar. |
| RF04 | O app deve embaralhar a posição de exibição das 4 opções de cor a cada rodada, evitando um padrão espacial fixo. |
| RF05 | O app deve iniciar cada rodada com um tempo limite, que diminui conforme o jogador acerta rodadas consecutivas, seguindo os degraus: 5s → 3s → 2s → 1,5s. |
| RF06 | O app deve encerrar a run quando o jogador tocar em uma opção diferente da cor certa. |
| RF07 | O app deve encerrar a run quando o tempo da rodada atual se esgotar sem toque do jogador. |
| RF08 | O app deve incrementar a pontuação da run a cada rodada respondida corretamente. |
| RF09 | O app deve salvar localmente a maior pontuação já alcançada (recorde pessoal). |
| RF10 | O app deve exibir a pontuação atual durante o jogo. |
| RF11 | O app deve exibir, ao final da run, a pontuação obtida e o recorde pessoal atualizado (se for o caso). |
| RF12 | O app deve permitir iniciar uma nova run a partir da tela de fim de jogo. |

## 2. Requisitos Não Funcionais

| ID | Descrição |
|---|---|
| RNF01 | O jogo deve funcionar de forma totalmente standalone no Apple Watch, sem depender do iPhone por perto nem de conexão com a internet. |
| RNF02 | Os limiares de queda de dificuldade (quantidade de acertos necessários para reduzir o tempo por rodada) devem ser fáceis de ajustar no código, para permitir balanceamento por testes. |
| RNF03 | As áreas de toque das opções de cor devem ter tamanho adequado para toque confiável na tela do Apple Watch. |
| RNF04 | O feedback de acerto/erro deve ser instantâneo, combinando indicação visual com haptic padrão do sistema (`WKHapticType`). |

## 3. Fora do escopo da v1 (previsto para versões futuras)
- Histórico de partidas anteriores (além do recorde atual).
- Estatística de tempo médio de reação por rodada.
- Modo "vidas" (permitir mais de um erro antes do fim de jogo).
- Lógica para evitar repetição da mesma cor certa em rodadas consecutivas.
- Paleta alternativa de cores voltada à acessibilidade (daltonismo).
