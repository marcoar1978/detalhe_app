import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class CounterBloc extends BlocBase {

  final BehaviorSubject<int> inc = BehaviorSubject<int>();

  CounterBloc(){
    this.inc.sink.add(0);
  }

  void increment(){
    this.inc.value++;
    this.inc.sink.add(this.inc.value);
  }

  @override
  void dispose(){
    this.inc.close();
  }



}