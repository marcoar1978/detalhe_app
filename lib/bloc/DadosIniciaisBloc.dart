import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:detalhe_app1/http/apis/LoginApi.dart';
import 'package:detalhe_app1/models/clinica-model.dart';
import 'package:detalhe_app1/models/dados-iniciais-model.dart';
import 'package:detalhe_app1/models/dentista-model.dart';
import 'package:detalhe_app1/models/produto-model.dart';
import 'package:detalhe_app1/models/protetico-model.dart';
import 'package:rxdart/rxdart.dart';

class DadosIniciaisBloc extends BlocBase {
  LoginApi loginApi;

  BehaviorSubject<int> carregamentoDados = BehaviorSubject<int>();
  BehaviorSubject<DadosIniciais> dadosSubject = BehaviorSubject<DadosIniciais>();
  BehaviorSubject<List<Clinica>> clinicasSubject = BehaviorSubject<List<Clinica>>();
  BehaviorSubject<List<Produto>> produtosSubject = BehaviorSubject<List<Produto>>();
  BehaviorSubject<List<Dentista>> dentistasSubject = BehaviorSubject<List<Dentista>>();
  BehaviorSubject<List<Protetico>> proteticosSubject = BehaviorSubject<List<Protetico>>();

  DadosIniciaisBloc() {
    this.loginApi = LoginApi();
    this.carregamentoDados.sink.add(0);
  }

  void carregarDados() async {
    DadosIniciais dadosInicias = await this.loginApi.getDataEUsuario();
    this.dadosSubject.sink.add(dadosInicias);
    List<Clinica> clinicas = await this.loginApi.getClinicas();
    this.clinicasSubject.sink.add(clinicas);
    List<Produto> produtos = await this.loginApi.detPrecos();
    this.produtosSubject.sink.add(produtos);
    List<Dentista> dentistas = await this.loginApi.getDentistas();
    this.dentistasSubject.sink.add(dentistas);
    List<Protetico> proteticos = await this.loginApi.getProteticos();
    this.proteticosSubject.sink.add(proteticos);
    this.carregamentoDados.sink.add(1);
  }
}
