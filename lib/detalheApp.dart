import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:detalhe_app1/enviroment/rotas.dart';
import 'package:flutter/material.dart';
import 'enviroment/blocs.dart';

class DetalheApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: Blocs.blocs,
      child: MaterialApp(
        initialRoute: '/',
        routes: Rotas.rotas,
      ),
    );
  }
}
