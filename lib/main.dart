import 'package:flutter/material.dart';
import 'package:account_app/LoginPage.dart';

void main() {
  runApp(AccountApp());
}

class AccountApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}