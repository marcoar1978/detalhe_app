import 'dart:convert';

import 'package:detalhe_app1/http/web_client.dart';
import 'package:detalhe_app1/models/dados-iniciais-model.dart';
import 'package:detalhe_app1/models/jwt.dart';
import 'package:http/http.dart';

class LoginApi {
  Future<Jwt> login(String login, String senha) async {
    Map<String, dynamic> dadosLogin = Map();
    dadosLogin['email'] = login;
    dadosLogin['senha'] = senha;

    Response response = await client.post(
      '${baseUrl}/auth',
      body: jsonEncode(dadosLogin),
    );

    if (response.statusCode == 200) {
      Jwt jwt = Jwt.fromMap(json.decode(response.body));
      return jwt;
    }
    throw Exception('Lançamento de Exceção');
  }

  Future<DadosIniciais> getDataEUsuario() async {
    Response response =
        await client.get('${baseUrl}/dadosIniciais/dataEUsuario');
    print('-----------------------------------------------------${response.statusCode}');
    if (response.statusCode == 200) {
      DadosIniciais dadosIniciais =
          DadosIniciais.fromMap(json.decode(response.body));
      return dadosIniciais;
    }

    throw Exception('Lançamento de Exceção');
  }
}
