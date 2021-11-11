import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persona_application/screens/tests.dart';
import 'package:persona_application/widgets/personality_traits.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TraitWidget(),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
        child: SizedBox(
          height: 40,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Tests(),
                  ));
            },
            child: Text('Test'),
          ),
        ),
      ),
    ]);
  }
}
