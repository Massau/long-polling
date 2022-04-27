import 'package:dio/dio.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

String mensagemRequisicao = '';
var dio = Dio();
final client = MqttServerClient('test.mosquitto.org', '');
var baseUrlRequisicao =
    'https://5569e8ba-121d-4d12-9d20-1c016de28201.mock.pstmn.io/mensagem';
