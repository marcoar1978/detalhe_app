

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:detalhe_app1/bloc/CounterBloc.dart';
import 'package:detalhe_app1/bloc/LoginBloc.dart';

class Blocs {
  static final blocs = [
    Bloc((i) => CounterBloc()),
    Bloc((i) => LoginBloc()),
  ];
}