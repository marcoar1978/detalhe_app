import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:detalhe_app1/bloc/DadosIniciaisBloc.dart';
import 'package:detalhe_app1/bloc/abrir-pedido-bloc.dart';
import 'package:detalhe_app1/models/clinica-model.dart';
import 'package:flutter/material.dart';

class AbrirPedido extends StatefulWidget {
  static String routeName = '/abrirPedido';

  @override
  _AbrirPedidoState createState() => _AbrirPedidoState();
}

class _AbrirPedidoState extends State<AbrirPedido> {
  final blocDadosIniciais = BlocProvider.getBloc<DadosIniciaisBloc>();
  final blocAbrirPedido = BlocProvider.getBloc<AbrirPedidoBloc>();

  //Clinica selectClinica;

  Widget _selClinica(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DropdownButtonFormField<Clinica>(
        hint: Text('Selecione a clinica'),
        value: this.blocAbrirPedido.selectClinica,
        items: this.blocDadosIniciais.clinicasSubject.value.map((Clinica c) {
          return DropdownMenuItem<Clinica>(
            value: c,
            child: Text(c.nomeSimp),
          );
        }).toList(),
        onChanged: (c) {
          setState(() {
            this.blocAbrirPedido.selectClinica = c;
          });
        },
        validator: (value) {
          if (value == null) {
            return 'Escolha a clinica';
          }
          return null;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    this.blocAbrirPedido.selectClinicaSubject.sink.add(Clinica());

    return Scaffold(
      appBar: AppBar(
        title: Text('Abrir Pedido'),
      ),
      body: Form(
        key: this.blocAbrirPedido.formKey,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            this._selClinica(context),
          ],
        ),
      ),
    );
  }
}