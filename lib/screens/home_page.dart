import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persona_application/screens/settings.dart';
import 'package:persona_application/screens/tests.dart';

import 'dashboard.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    Tests(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Persona'),
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard_rounded), label: "Dashboard"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.quiz_sharp), label: "Tests"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Settings")
            ]));
  }
}
