import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Agendamento extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StateAgendamento();
  }
}

class Horario{
  int id;
  String hora;

  Horario(this.id,this.hora);

  static List<Horario> getHorario (){
    return <Horario>[
      Horario(1,"07:00"),
      Horario(1,"08:00"),
      Horario(1,"09:00"),
      Horario(1,"10:00"),
      Horario(1,"11:00"),
      Horario(1,"12:00"),
      Horario(1,"13:00"),
      Horario(1,"14:00"),
      Horario(1,"15:00"),
      Horario(1,"16:00"),
      Horario(1,"17:00"),
      Horario(1,"18:00"),
      Horario(1,"19:00"),
      ];
  }
}

class StateAgendamento extends State<Agendamento>{
   DateTime _date=DateTime.now();//Pegar Data Atual
   List<Horario> _horarios=Horario.getHorario();
   List<DropdownMenuItem<Horario>> _dropdownhorarios;
   Horario _selectedHorario;
   
   @override
   void initState(){
     _dropdownhorarios=Builddrophorarios(_horarios);
     _selectedHorario=_dropdownhorarios[0].value;
     super.initState();
   }

   List<DropdownMenuItem<Horario>> Builddrophorarios(List horarios){
       List<DropdownMenuItem<Horario>> horas = List();

       for(Horario hora in horarios){
         horas.add(DropdownMenuItem(value: hora,child: Text(hora.hora)));
       }
       return horas;
   }

   Future<Null> FazData(BuildContext context) async {
      final DateTime DataClick= await showDatePicker(
        context: context,
        initialDate:_date,
        firstDate: DateTime(2020),
        lastDate: DateTime(2025)
      );
      if(DataClick !=null && DataClick!=_date){
        setState(() {
          _date=DataClick;
          print(_date.toString());
        });
      }
    }
    ChangedHorario(Horario selectHoraio){
        setState(() {
          _selectedHorario=selectHoraio;
        });
    }
  @override
  Widget build(BuildContext context) {
   
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title:Text("Reserva"),
      ),
      body: Column(
        children:<Widget>[
            RaisedButton(
          onPressed: (){
            FazData(context);

          },
          child: Text(
            'Selecionar Data',
            style: TextStyle(fontSize: 20)
          ),
        ),
        Container(
          child: Column(children: <Widget>[
            Text("Horario"),
            DropdownButton(
              value: _selectedHorario,
              items: _dropdownhorarios, onChanged: ChangedHorario),
            SizedBox(height: 40.0),
            Text("Dia:DataSelecionada Hora:${_selectedHorario.hora}")


          ],),
        )
        ]
      ),

    );
  }

}