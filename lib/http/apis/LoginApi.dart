import 'dart:convert';

import 'package:detalhe_app1/http/web_client.dart';
import 'package:http/http.dart';

class LoginApi {
  Future<int> login(String login, String senha) async {
    Map<String, dynamic> dadosLogin = Map();
    dadosLogin['email'] = login;
    dadosLogin['senha'] = senha;

    Map<String, String> headersMap = Map();
    headersMap['Content-type'] = 'application/json';

    Response response = await client.post(
      '${baseUrl}/auth',
      headers: headersMap,
      body: jsonEncode(dadosLogin),
    );

    if (response.statusCode == 200) {
      print(response.body);
      return 1;
    }
    throw Exception('Lançamento de Exceção');
  }
}
