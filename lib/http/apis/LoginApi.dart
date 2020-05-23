import 'dart:convert';

import 'package:detalhe_app1/http/web_client.dart';
import 'package:detalhe_app1/models/clinica-model.dart';
import 'package:detalhe_app1/models/dados-iniciais-model.dart';
import 'package:detalhe_app1/models/dentista-model.dart';
import 'package:detalhe_app1/models/jwt.dart';
import 'package:detalhe_app1/models/produto-model.dart';
import 'package:detalhe_app1/models/protetico-model.dart';
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
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      DadosIniciais dadosIniciais =
          DadosIniciais.fromMap(json.decode(body));
      return dadosIniciais;
    }

    throw Exception('Lançamento de Exceção');
  }

  Future<List<Clinica>> getClinicas() async {
    Response response = await client.get('${baseUrl}/clinicas');
    if(response.statusCode == 200){
      String body = utf8.decode(response.bodyBytes);
      List<dynamic> clinicasMap = json.decode(body);
      List<Clinica> clinicas = clinicasMap.map<Clinica>((clinicaMap){
        return Clinica.fromMap(clinicaMap);
      }).toList();
      return clinicas;
    }
    throw Exception('Lançamento de Exception');
  }

  Future<List<Produto>> detPrecos() async{
    Response response = await client.get('${baseUrl}/produto/detPrecos');
    if(response.statusCode == 200){
      String body = utf8.decode(response.bodyBytes);
      List<dynamic> produtosMap = json.decode(body);
      List<Produto> produtos = produtosMap.map<Produto>((produtoMap){
        return Produto.fromMap(produtoMap);
      }).toList();
      return produtos;
    }
    throw Exception('Lançamento de Exception');
  }

  Future<List<Dentista>> getDentistas() async{
    Response response = await client.get('$baseUrl/dentista');
    if(response.statusCode == 200){
      String body = utf8.decode(response.bodyBytes);
      List<dynamic> dentistasMap = json.decode(body);
      List<Dentista> dentistas = dentistasMap.map((dentistaMap){
        return Dentista.fromMap(dentistaMap);
      }).toList();
      return dentistas;
    }
    throw Exception('Lançamento de Exception');
  }

  Future<List<Protetico>> getProteticos() async {
    Response response = await client.get('${baseUrl}/proteticos');
    if(response.statusCode == 200){
      String body = utf8.decode(response.bodyBytes);
      List<dynamic> proteticosMap = json.decode(body);
      List<Protetico>  proteticos = proteticosMap.map((proteticoMap){
        return Protetico.fromMap(proteticoMap);
      }).toList();
      return proteticos;
    }
    throw Exception('Lançamento de Exception');
  }


}
