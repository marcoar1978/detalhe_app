import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:detalhe_app1/http/apis/LoginApi.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends BlocBase {
  LoginApi loginApi;
  final formKey = GlobalKey<FormState>();
  TextEditingController loginController = TextEditingController();
  TextEditingController senhaCOntroller = TextEditingController();

  BehaviorSubject<int> login = BehaviorSubject<int>();
  BehaviorSubject<String> excecoes = BehaviorSubject<String>();
  BehaviorSubject<String> login2 = BehaviorSubject<String>();

  LoginBloc() {
    this.loginApi = LoginApi();
    this.login.sink.add(0);
    this.login2.sink.add('');
    this.excecoes.sink.add('ok');
  }

  logar() {
    String login = loginController.text;
    String senha = senhaCOntroller.text;
    this.loginApi.login(login, senha).then((value) {
      this.login2.sink.add('Login efetuado');
    }).catchError((e) {
      //this.excecoes.sink.add('${e.message}');
      this.login2.sink.add('${e.message}');
    });
  }
}
