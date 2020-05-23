import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:detalhe_app1/models/clinica-model.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class AbrirPedidoBloc extends BlocBase {
  final formKey = GlobalKey<FormState>();
  BehaviorSubject<Clinica> selectClinicaSubject = BehaviorSubject<Clinica>();
  Clinica selectClinica;

  AbrirPedidoBloc() {
    //this.selectClinicaSubject.sink.add(Clinica());
  }

  void changedClinica(Clinica c){
    this.selectClinica = c;

  }


}
