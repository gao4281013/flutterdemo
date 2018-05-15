import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_gank/net/daily_list.dart';


class DialyPage extends StatefulWidget {
  @override
  _DialyPageState createState() => new _DialyPageState();
}

class _DialyPageState extends State<DialyPage> {
  DateTime selectedDate = new DateTime.utc(2107,09,01,10,00);

  final String _url = "http://gank.io/api/day";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('每日干货'),
        actions: <Widget>[
          new Padding(padding: const EdgeInsets.all(4.0),
          child: new IconButton(
              icon: new Icon(Icons.calendar_today),
              onPressed: (){
                _selectDate(context);
              }),
          ),
          new Padding(padding: const EdgeInsets.all(4.0),
            child: new IconButton(
                icon: new Icon(Icons.search),
                onPressed: (){

                }),
          ),

        ],
      ),

      body: new DailyList(
        url: _url + "/" + selectedDate.year.toString() +"/"+
        selectedDate.month.toString()+"/"+
        selectedDate.day.toString()
      ) ,

    );
  }

  Future<Null> _selectDate(BuildContext context) async{
     final DateTime picked = await showDatePicker(
         context: context,
         initialDate: selectedDate,
         firstDate: new DateTime(2015,8),
         lastDate: new DateTime(2017,9)
     );

     if(picked !=null && picked != selectedDate){
       setState(() {
         selectedDate = picked;
       });
     }

  }
}
