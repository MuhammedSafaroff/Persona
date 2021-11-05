import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persona_application/screens/settings.dart';
import 'package:persona_application/screens/tests.dart';

import 'dashboard.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body:  _widgetOptions.elementAt(_selectedIndex),

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
