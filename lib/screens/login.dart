import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:detalhe_app1/bloc/DadosIniciaisBloc.dart';
import 'package:detalhe_app1/bloc/LoginBloc.dart';
import 'package:detalhe_app1/models/dados-iniciais-model.dart';
import 'package:detalhe_app1/models/form/LoginForm.dart';
import 'package:detalhe_app1/screens/home.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  static String routeName = '/';
  final bloc = BlocProvider.getBloc<LoginBloc>();

  Login(){

    BlocProvider.getBloc<DadosIniciaisBloc>().dadosSubject.add(DadosIniciais('',''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: bloc.formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24.0, left: 24.0),
                child: Container(
                  width: 100,
                  child: Image.asset('assets/images/logo_detalhe_web.png')
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: bloc.loginController,
                decoration: InputDecoration(
                    labelText: 'Login', icon: Icon(Icons.account_circle)),
                validator: (text) {
                  if (text.isEmpty) {
                    return 'Digite o login';
                  }
                },
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: bloc.senhaCOntroller,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Senha', icon: Icon(Icons.vpn_key)),
                validator: (text) {
                  if (text.isEmpty) {
                    return 'Digite a senha';
                  }
                },
              ),
              SizedBox(
                height: 24,
              ),
              RaisedButton(
                color: Colors.blue[700],
                textColor: Colors.white,
                child: Text('Login'),
                onPressed: () async {
                  if (bloc.formKey.currentState.validate()) {
                    BlocProvider.getBloc<DadosIniciaisBloc>().carregamentoDados.sink.add(0);
                    await bloc.logar(context);
                  }
                },
              ),
              SizedBox(
                height: 16,
              ),
              StreamBuilder<LoginForm>(
                stream: bloc.login.stream,
                builder: (context, snapshot) {
                  LoginForm loginForm;
                  if (snapshot.hasData) {
                    loginForm = snapshot.data;
                    if (loginForm.codigo == 100) {
                      return Center(child: CircularProgressIndicator());
                    }
                  }

                  return Text('');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
