import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persona_application/widgets/personality_traits.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: const [TraitWidget()]);
  }
}
