import 'package:flutter/material.dart';
import 'package:motovibe/components/progress.dart';
import 'package:motovibe/http/webclient.dart';
import 'package:motovibe/model/DadosSalvos.dart';

class MeusAgendamentos extends StatelessWidget {
  //DadosSalvos dado = DadosSalvos("yakuza", 100, "23/12/1999", "10:00");

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text("Meus Agendamentos")),
        body: FutureBuilder<List<DadosSalvos>>(
            future: findAll(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  break;
                case ConnectionState.waiting:
                return Progress();
                  break;
                case ConnectionState.active:
                  break;
                case ConnectionState.done:
                final List<DadosSalvos> dado = snapshot.data;
                
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    
                      controiAgendamentos(dado[0]),
                      controiAgendamentos(dado[1]),


                    
                    
                  ],
                ),
              );
                  break;
                
              }
              return Text("Erro");
              
            }));
  }

  Column controiAgendamentos(DadosSalvos dados) {
    return Column(
      children: <Widget>[
        Container(
          width: 500,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
                "Modelo:${dados.modelo}\n Valor:${dados.valor} \n Data:${dados.data}\n Hora:${dados.hora}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }
}
