import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persona_application/screens/settings.dart';
import 'package:persona_application/screens/sing_in_up/sign_in.dart';
import 'package:persona_application/screens/tests.dart';
import 'package:persona_application/utils/my_shared_preferences.dart';

import 'dashboard.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.response = -1}) : super(key: key);
  final int response;
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
          title: Text(widget.response == 0
              ? 'Success'
              : widget.response == 1
                  ? 'Error'
                  : 'Persona'),
          backgroundColor: widget.response == 1 ? Colors.red : Colors.green,
          actions: [
            IconButton(
              onPressed: () async {
                await MySharedPreferences().removeSharedToken();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignIn(),
                  ),
                );
              },
              icon: Icon(Icons.logout),
            ),
          ],
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
