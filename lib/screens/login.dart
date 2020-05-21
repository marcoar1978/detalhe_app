import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:detalhe_app1/bloc/CounterBloc.dart';
import 'package:detalhe_app1/bloc/LoginBloc.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  static String routeName = '/';
  final bloc = BlocProvider.getBloc<LoginBloc>();

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
                decoration: InputDecoration(
                    labelText: 'Senha', icon: Icon(Icons.vpn_key)),
                validator: (text) {
                  if (text.isEmpty) {
                    return 'Digite a senha';
                  }
                },
              ),
              SizedBox(
                height: 16,
              ),
              RaisedButton(
                child: Text('Login'),
                onPressed: () {
                  if (bloc.formKey.currentState.validate()) {}
                },
              ),
              SizedBox(
                height: 16,
              ),
              StreamBuilder(
                stream: bloc.login2.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text('${snapshot.data}');
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
