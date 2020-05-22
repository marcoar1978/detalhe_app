import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:detalhe_app1/bloc/DadosIniciaisBloc.dart';
import 'package:detalhe_app1/bloc/LoginBloc.dart';
import 'package:detalhe_app1/models/dados-iniciais-model.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static String routeName = '/home';
  final bloc = BlocProvider.getBloc<DadosIniciaisBloc>();

  Home() {
    bloc.carregarDados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Column(
          children: <Widget>[
            StreamBuilder<int>(
              stream: bloc.carregamentoDados.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data == 0) {
                    return Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  DadosIniciais dadosIniciais = bloc.dadosSubject.value;
                  return Expanded(
                    child: Center(
                      child: Text('${dadosIniciais.dataHoje}'),
                    ),
                  );
                }
                return Text('');
              },
            )
          ],
        ));
  }
}
