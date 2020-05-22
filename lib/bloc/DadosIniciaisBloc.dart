import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:detalhe_app1/http/apis/LoginApi.dart';
import 'package:detalhe_app1/models/dados-iniciais-model.dart';
import 'package:rxdart/rxdart.dart';


class DadosIniciaisBloc extends BlocBase{
  LoginApi loginApi;

  BehaviorSubject<int> carregamentoDados = BehaviorSubject<int>();
  BehaviorSubject<DadosIniciais> dadosSubject = BehaviorSubject<DadosIniciais>();

  DadosIniciaisBloc(){
    this.loginApi = LoginApi();
    this.carregamentoDados.sink.add(0);
  }

  void carregarDados() async {
    DadosIniciais dadosInicias = await this.loginApi.getDataEUsuario();
    this.dadosSubject.sink.add(dadosInicias);
    this.carregamentoDados.sink.add(1);
  }



}