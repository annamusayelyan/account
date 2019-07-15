import 'package:flutter/material.dart';

class FinalPage extends StatelessWidget {
  final String name;
  final String surname;
  final String email;
  final int phone;
  final int date;
  final String homePlace;
  final int code;
  final String married;
  final String teacher;
  final String hobby;

  FinalPage(this.name, this.surname, this.email, this.phone, this.date,
      this.homePlace, this.code, this.married, this.teacher, this.hobby);
@override
  Widget build(BuildContext context) {
  return
    Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: Column(children: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Image.asset('assets/user.png', width: 150.0, height:150.0),
        ],
      ),
        Column(children: <Widget>[
          Text(name),
          Text(surname),
          Text(email),
          Text(phone.toString()),
          Text(date.toString()),
          Text(homePlace),
          Text(code.toString()),
          Text(married),
          Text(teacher),
          Text(hobby),
        ],)

      ],),

    );
  }

}