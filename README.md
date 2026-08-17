# Stroop Test — Apple Watch ⌚️🧠

Um jogo de treinamento cerebral rápido e desafiador desenvolvido exclusivamente para o **Apple Watch**. Baseado no famoso [Efeito Stroop](https://pt.wikipedia.org/wiki/Efeito_Stroop) da neurociência, o jogo testa sua agilidade mental e tempo de reação criando um conflito entre o lado esquerdo e direito do seu cérebro.

> **O Desafio:** A tela mostrará o nome de uma cor, mas o texto estará pintado com uma *tinta diferente*. O seu cérebro vai querer focar na cor brilhante, mas a sua missão é ignorar a tinta e tocar no botão correspondente à **palavra escrita** antes que o tempo acabe!

---

## 🚀 Funcionalidades (Features)

- **Gameplay Dinâmico:** Dificuldade adaptativa. Quanto mais você acerta, mais o relógio acelera (de 5.0s até 1.5s de tempo de reação).
- **Haptic Feedback:** Integração tátil profunda com o motor vibratório do Apple Watch para confirmar acertos e punir erros usando o sistema nativo `WKHapticType`.
- **Persistência de Dados Nativos:** Salvamento automático da sua maior pontuação (High Score) de forma local usando o poderoso `SwiftData`.
- **Localização (Multi-idiomas):** Jogo totalmente traduzido e adaptável (Inglês e Português) utilizando os novos `String Catalogs` da Apple.
- **Testes Automatizados:** Alta cobertura de qualidade com **Testes Unitários** modernos (via `Swift Testing` e injeção de dependências) e **Testes de UI End-to-End** (via `XCUITest`) validando fluxos de tela, botões isolados dinâmicos e game over.
- **Experiência Standalone:** Jogo 100% independente que não exige iPhone pareado próximo ou conexão de rede para ser jogado.
- **Design Premium:** UI imersiva construída com animações fluídas e tipografia moderna.

---

## 🛠️ Arquitetura & Tecnologias

Este projeto foi construído do zero adotando as melhores práticas do ecossistema Apple para a construção de apps robustos, testáveis e escaláveis:

- **watchOS 10+** (Alvo)
- **SwiftUI:** Interface totalmente declarativa, modularização de componentes visuais (`ColorButton`, `PlayingView`, `GameOverView`) e roteamento isolado.
- **SwiftData:** Camada de banco de dados nativa super leve. Uso extensivo da macro `@Model` e integração reativa de dados diretamente nas Telas através do `@Query`.
- **MVVM + @Observable (Swift 5.9):** Separação estrita entre a UI, a Lógica de Negócios (Orquestração via `GameEngine`) e os Modelos de Dados.
- **Test-Driven Design:** Arquitetura construída pensando em simulação e isolamento (`@MainActor`, AAA Pattern).

---

## 📸 Screenshots

*(Substitua estas imagens no código do README pelas fotos reais do seu app depois)*

<p align="center">
  <img src="https://via.placeholder.com/150/000000/FFFFFF?text=Start+Screen" width="200" />
  <img src="https://via.placeholder.com/150/000000/FFFFFF?text=Gameplay" width="200" />
  <img src="https://via.placeholder.com/150/000000/FFFFFF?text=Game+Over" width="200" />
</p>

---

## ⚙️ Instalação e Execução

Para rodar este projeto na sua máquina e estudá-lo:

1. Clone o repositório:
   ```bash
   git clone https://github.com/SEU-USUARIO/stroop-test-watchos.git
   ```
2. Abra o projeto no **Xcode 15** (ou superior).
3. Certifique-se de selecionar um simulador do **Apple Watch** no topo da janela do Xcode (ex: *Apple Watch Series 9* ou *Ultra 2*).
4. Pressione `Cmd + R` para compilar e jogar!

*(Nota: Para executar o app diretamente em um Apple Watch físico através do cabo, certifique-se de que o "Modo de Desenvolvedor" esteja ativado nos Ajustes de Privacidade do relógio).*

---

## 📄 Licença

Este projeto é de código aberto e está licenciado sob a **MIT License**. Você é totalmente livre para estudar, fazer forks, modificar e utilizar o código para uso pessoal ou comercial. Para mais detalhes, consulte o arquivo `LICENSE` no repositório.

---
*Feito com ⌚️, Swift e ☕️ por Pedro Santos.*
