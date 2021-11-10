import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:persona_application/screens/home_page.dart';
import 'package:persona_application/screens/sing_in_up/sign_in.dart';
import 'package:persona_application/utils/my_shared_preferences.dart';

ValueNotifier<String> loginControl = ValueNotifier<String>('');
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  loginControl.value = await MySharedPreferences().getSharedToken();
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
      home: ValueListenableBuilder<String>(
          valueListenable: loginControl,
          builder: (context, value, c) {
            if (value == '') {
              return SignIn();
            } else {
              return MyHomePage();
            }
          }),
    );
  }
}
