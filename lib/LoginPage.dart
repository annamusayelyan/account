import 'package:flutter/material.dart';
import 'package:account_app/final.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  String name;
  String surname;
  String email;
  int phone;

  final _formKey = GlobalKey<FormState>();

  Map<String,dynamic> _profile = {
     "name":null,
    "surname":null,
    "email":null,
    "phone":null,

  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Create Account')),
        body: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.all(15.0),
            child: ListView(
              children: <Widget>[
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter some text';
                    }
                    return null;
                  },
                  onFieldSubmitted: (String value) {
                    setState(() {
                      _profile ['name'] = value;
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
                      _profile ['surname']= value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Surname',
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter some e-mail';
                    }
                    return null;
                  },
                  onFieldSubmitted: (String value) {
                    setState(() {
                      _profile ['email']= value;
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
                      _profile ['phone'] = int.parse(value);
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Phone',
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => FinalPage(
                         _profile
                        ),
                  ),
                );
              }
            }));
  }
}
