import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import '1.mqtt.dart';
import '3.web_api.dart';
import 'constantes.dart';

// void main() async {
//   var fluxoDadosPrincipal = await compartilhamentoMsgDePorta();
//   fluxoDadosPrincipal.send(mensagemRequisicao);
// }

Future<SendPort> compartilhamentoMsgDePorta() async {
  Completer completer = Completer<SendPort>();
  var principalFluxoDadosIsolate = ReceivePort();

  principalFluxoDadosIsolate.listen((dados) {
    if (dados is SendPort) {
      var fluxoDadosIsolate = dados;
      completer.complete(fluxoDadosIsolate);
    } else {
      print(dados);
    }
  });

  await Isolate.spawn(recebeMensagem, principalFluxoDadosIsolate.sendPort);
  return completer.future;
}

void recebeMensagem(SendPort principalFluxoDadosIsolate) {
  var fluxoDadosIsolate = ReceivePort();
  principalFluxoDadosIsolate.send(fluxoDadosIsolate.sendPort);

  fluxoDadosIsolate.listen((dados) async {
    var dados = await postMensagem(mensagemRequisicao);
    print('dados: $dados');
  });
  client.disconnect();
  
  client.logging(on: false);
  client.setProtocolV311();
  client.keepAlivePeriod = 20;
  client.onDisconnected = onDisconnected;
  client.onConnected = onConnected;
  client.onSubscribed = onSubscribed;
  realizaConexao();

  // principalFluxoDadosIsolate.send('This is from recebeMensagem()');
}
