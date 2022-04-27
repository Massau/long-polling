# long-polling

Projeto apresentado para a disciplina de Sistemas Distribuídos do Centro Universitário Eurípedes de Marília (UNIVEM)

Tecnologia utilizada: Flutter, versão 2.1.0-12.1.pre

### Diferenças entre projeto do repositório 'mqtt-http'
Houve a tentativa de tentar implementar o projeto utilizando Flutter, em virtude de apresentar uma interface gráfica, e não apenas a linguagem Dart, conforme projeto anterior

Não foi possível implementar com Flutter e Dart o solicitado, atualizando a tela em tempo real utilizando Long Polling e Socket. O que a linguagem permitiria próximo a isso seria, utilizando um gerenciamento de estado, como Mobx ou BLOC, por exemplo, ficar armazenar o conteúdo das mensagens em uma variável e implementar um Observer que verificaria se houve mudança para possibilitar atualizar a página

Das mudanças na implementação, a aplicação não é encerrada ao receber a mensagem, de modo que fique escutando as mensagens que chegam a ela