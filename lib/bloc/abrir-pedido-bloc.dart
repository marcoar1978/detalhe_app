import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:detalhe_app1/bloc/DadosIniciaisBloc.dart';
import 'package:detalhe_app1/models/clinica-model.dart';
import 'package:detalhe_app1/models/dentista-model.dart';
import 'package:detalhe_app1/models/produto-model.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class AbrirPedidoBloc extends BlocBase {
  final formKey = GlobalKey<FormState>();
  final blocDados = BlocProvider.getBloc<DadosIniciaisBloc>();
  BehaviorSubject<Clinica> selectClinicaSubject = BehaviorSubject<Clinica>();
  BehaviorSubject<List<Dentista>> dentistaPorClinicaSubject =
      BehaviorSubject<List<Dentista>>();
  BehaviorSubject<List<Produto>> selectProdutoSelSubject =
      BehaviorSubject<List<Produto>>();

  Clinica selectClinica;
  Dentista selectDentista;
  List<Dentista> dentistas;
  bool visibleSelDentista;

  AbrirPedidoBloc() {
    //this.selectClinicaSubject.sink.add(Clinica());
    this.dentistas = this.blocDados.dentistasSubject.value;
    this.dentistaPorClinicaSubject.sink.add(this.dentistas);
    this.visibleSelDentista = false;
  }

  void changedClinica(Clinica c) {
    this.selectClinica = c;
  }

  void selDentista(int clinicaId) {
    List<Dentista> dentistasPorClinica = this
        .dentistas
        .where((dentista) => dentista.clinicaId == clinicaId)
        .toList();
    this.dentistaPorClinicaSubject.sink.add(dentistasPorClinica);
  }

  selProdutosPorClinica(int listaId) {
    List<Produto> produtos = this.blocDados.produtosSubject.value;
    List<Produto> produtosSel =
        produtos.where((produto) => produto.listaId == listaId).toList();
    print(produtosSel);
    this.selectProdutoSelSubject.sink.add(produtosSel);
  }
}
