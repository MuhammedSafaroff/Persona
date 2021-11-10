import 'package:flutter/material.dart';
import 'package:persona_application/screens/sing_in_up/sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persona',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SignIn(),
    );
  }
}
