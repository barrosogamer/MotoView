import 'package:flutter/material.dart';
import 'package:motovibe/model/DadosSalvos.dart';
import 'package:motovibe/model/cliente.dart';
import 'package:motovibe/screen/Inicio.dart';
import 'package:motovibe/screen/historico.dart';

import 'http/webclient.dart';

void main(){ runApp(Home());
  savaAgenda(DadosSalvos("YKZ",300,"10/03/2020","10:00")).then((dado)=> print("Salvo ou n:$dado"));
  findAll().then((clientes)=>print("new cliente $clientes"));

}
class Home extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red[900],
        accentColor: Colors.grey[600],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.grey[600],
          textTheme: ButtonTextTheme.primary,
        ), //ButtonThemeData
      ), //ThemeData
      home: Inicio(),
    );
  }
}