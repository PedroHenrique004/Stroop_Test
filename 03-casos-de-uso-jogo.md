# Casos de Uso — Jogo de Cores (Stroop Test) para Apple Watch (v1)

## UC01 — Iniciar novo jogo
**Ator:** Usuário (Apple Watch)
**Pré-condição:** App instalado e aberto na tela inicial.
**Fluxo principal:**
1. Usuário toca em "Jogar".
2. App inicializa a pontuação da run em zero e define o tempo limite inicial (5s).
3. App solicita ao RoundGenerator a primeira rodada.
4. App exibe as 4 opções de cor e a palavra central, e inicia o RoundTimer.
**Pós-condição:** Primeira rodada da run em andamento.

## UC02 — Responder uma rodada corretamente
**Ator:** Usuário (Apple Watch)
**Pré-condição:** Rodada em andamento (UC01 ou rodada seguinte já iniciada).
**Fluxo principal:**
1. Usuário toca na opção de cor que corresponde à cor da tinta da palavra (a "cor certa").
2. App confirma o acerto, exibe feedback visual/haptic de sucesso.
3. App incrementa a pontuação da run.
4. App consulta o DifficultyManager para verificar se o tempo limite deve diminuir (com base na nova pontuação).
5. App solicita a próxima rodada ao RoundGenerator e reinicia o RoundTimer.
**Pós-condição:** Pontuação atualizada; nova rodada em andamento.

## UC03 — Errar uma rodada (fim de jogo)
**Ator:** Usuário (Apple Watch)
**Pré-condição:** Rodada em andamento.
**Fluxo principal:**
1. Usuário toca em uma opção de cor diferente da cor certa.
2. App exibe feedback visual/haptic de erro.
3. App encerra a run atual.
4. App verifica se a pontuação da run superou o HighScore salvo; se sim, atualiza o recorde.
5. App exibe a tela de fim de jogo com a pontuação obtida e o recorde atual.
**Pós-condição:** Run encerrada; recorde atualizado se aplicável.

## UC04 — Esgotar o tempo da rodada (fim de jogo)
**Ator:** Sistema (RoundTimer)
**Pré-condição:** Rodada em andamento, sem toque do usuário até o fim do tempo limite.
**Fluxo principal:**
1. RoundTimer atinge zero sem registro de toque do usuário.
2. App trata esse evento como erro automático.
3. Segue o mesmo fluxo do UC03 a partir do passo 2 (feedback de erro, encerramento da run, verificação de recorde, tela de fim de jogo).
**Pós-condição:** Run encerrada; recorde atualizado se aplicável.

## UC05 — Visualizar pontuação final e recorde
**Ator:** Usuário (Apple Watch)
**Pré-condição:** Run recém-encerrada (UC03 ou UC04).
**Fluxo principal:**
1. App exibe a pontuação obtida na run que acabou de terminar.
2. App exibe o recorde pessoal atual (atualizado ou não, dependendo do resultado).
**Pós-condição:** Usuário ciente do resultado da run e do recorde vigente.

## UC06 — Reiniciar jogo após fim de partida
**Ator:** Usuário (Apple Watch)
**Pré-condição:** Tela de fim de jogo exibida (após UC05).
**Fluxo principal:**
1. Usuário toca em "Jogar novamente".
2. App reinicia o fluxo a partir do UC01.
**Pós-condição:** Nova run iniciada.

## Fora do escopo da v1 (previsto para versões futuras)
- Caso de uso de visualização de histórico de partidas anteriores.
- Caso de uso de visualização de estatísticas de tempo médio de reação.
- Caso de uso de perda de "vida" (em um eventual modo com múltiplos erros permitidos).
