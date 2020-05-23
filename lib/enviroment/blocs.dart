
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:detalhe_app1/bloc/CounterBloc.dart';
import 'package:detalhe_app1/bloc/DadosIniciaisBloc.dart';
import 'package:detalhe_app1/bloc/LoginBloc.dart';
import 'package:detalhe_app1/bloc/abrir-pedido-bloc.dart';

class Blocs {
  static final blocs = [
    Bloc((i) => CounterBloc()),
    Bloc((i) => LoginBloc()),
    Bloc((i) => DadosIniciaisBloc()),
    Bloc((i) => AbrirPedidoBloc()),
  ];
}