import 'package:detalhe_app1/models/form/LoginForm.dart';
import 'package:detalhe_app1/models/jwt.dart';
import 'package:detalhe_app1/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:detalhe_app1/http/apis/LoginApi.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends BlocBase {
  LoginApi loginApi;
  final formKey = GlobalKey<FormState>();
  TextEditingController loginController = TextEditingController();
  TextEditingController senhaCOntroller = TextEditingController();

  BehaviorSubject<LoginForm> login = BehaviorSubject<LoginForm>();
  BehaviorSubject<String> token = BehaviorSubject<String>();

  LoginBloc() {
    this.loginApi = LoginApi();
    this.login.sink.add(LoginForm(codigo: 0, msg: ''));
    this.token.sink.add('');
  }

  logar(BuildContext context) {
    String login = loginController.text;
    String senha = senhaCOntroller.text;
    LoginForm loginForm = LoginForm(codigo: 100, msg: '');
    this.login.sink.add(loginForm);
    this.loginApi.login(login, senha).then((jwt) {
      this.token.sink.add(jwt.token);
      LoginForm loginForm = LoginForm(codigo: 200, msg: 'Login Efetuado');
      this.login.sink.add(loginForm);
      Navigator.pushNamed(context, Home.routeName);
    }).catchError((e) {
      LoginForm loginForm = LoginForm(codigo: 400, msg: e.message);
      this.login.sink.add(loginForm);
      this.dialogLogin(context);
    });
  }

  Widget dialogLogin(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.error, color: Colors.yellow[700], size: 40,),
                SizedBox(height: 16,),
                Text('Login ou senha está incorreto'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Fechar'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  @override
  void dispose() {}
}
