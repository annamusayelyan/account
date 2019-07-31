import 'package:flutter/material.dart';
import 'package:account_app/final.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  DateTime date;
  final format = DateFormat("EEEE, MMMM d, yyyy");

  Map<String, dynamic> _profile = {
    "name": null,
    "surname": null,
    "gender": null,
    "email": null,
    "phone": null,
    "birth": null,
    "married":false,
  };

  DropdownButton<String> _dropdown() => DropdownButton(
    hint:Text('Select gender') ,
        items: [
          DropdownMenuItem(
            child: Text('Male'),
            value: 'Male',
          ),
          DropdownMenuItem(
            child: Text('Female'),
            value: 'Female',
          ),
        ],
        onChanged: (value) {
          setState(() {
            _profile["gender"] = value;
          });
        },
        value: _profile["gender"],
      );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Create Account')),
        body: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.all(15.0),
            child: ListView(children: <Widget>[
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter some text';
                  }
                  return null;
                },
                onFieldSubmitted: (String value) {
                  setState(() {
                    _profile['name'] = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter some text';
                  }
                  return null;
                },
                onFieldSubmitted: (String value) {
                  setState(() {
                    _profile['surname'] = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Surname',
                ),
              ),
              _dropdown(),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter some e-mail';
                  }
                  return null;
                },
                onFieldSubmitted: (String value) {
                  setState(() {
                    _profile['email'] = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'E-mail address',
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter some phone';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                onFieldSubmitted: (String value) {
                  setState(() {
                    _profile['phone'] = int.parse(value);
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Phone',
                ),
              ),
              DateTimePickerFormField(
                  format: format,
                  editable: false,
                  dateOnly: true,
                  decoration: InputDecoration(
                      labelText: 'Date', hasFloatingPlaceholder: false),
                  onChanged: (dt) {
                    date = dt;
                    setState(() {
                      _profile['birth'] = date;
                    });
                  }),
              SwitchListTile(value: _profile['married'],
                  title: Text("Married"),
                  activeColor: Colors.blue,
                  secondary: Icon(Icons.home),
                  onChanged: (bool value) {

                setState(() {
                  _profile['married'] = value;
                  print(_profile['married'].toString());
                });

                  }),

            ]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => FinalPage(_profile),
                  ),
                );
              }
            }));
  }
}
