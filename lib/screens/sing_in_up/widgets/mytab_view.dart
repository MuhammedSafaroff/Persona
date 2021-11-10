import 'package:flutter/material.dart';
import 'package:persona_application/screens/sing_in_up/widgets/sign_in_widget.dart';
import 'package:persona_application/screens/sing_in_up/widgets/sign_up_widget.dart';

class MyTabView extends StatelessWidget {
  final TabController? controller;
  const MyTabView({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: controller,
      children: [
        SignInWidget(),
        SignUpWidget(),
      ],
    );
  }
}
