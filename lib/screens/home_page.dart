import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persona_application/screens/settings.dart';
import 'package:persona_application/screens/sing_in_up/sign_in.dart';
import 'package:persona_application/screens/tests.dart';
import 'package:persona_application/utils/my_shared_preferences.dart';

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
    // Tests(),
    Settings(),
  ];

  @override
  void initState() {
    valueTest.addListener(() {
      if (valueTest.value == 0) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text('The operation was successful'),
              actions: <Widget>[
                TextButton(
                    child: Text('OK'),
                    onPressed: () => Navigator.of(context).pop()),
              ],
            );
          },
        );
      } else if (valueTest.value == 1) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Unknown error has occurred'),
              actions: <Widget>[
                TextButton(
                    child: Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop()),
              ],
            );
          },
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Persona'),
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
                  icon: Icon(Icons.settings), label: "Settings")
            ]));
  }
}
