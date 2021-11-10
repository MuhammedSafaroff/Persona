import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/mytab_view.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  Size? size;

  List<Tab> _tabList = [
    Tab(
      child: Text(
        "Login",
      ),
    ),
    Tab(
      child: Text(
        "Sign-up",
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Container(
                height: size!.height * 0.35,
                child: AppBar(
                  flexibleSpace: Center(
                    child: Text(
                      "Vstore",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    ),
                  ),
                  bottom: TabBar(
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(width: 4.0, color: Colors.green),
                      insets: EdgeInsets.symmetric(horizontal: 30.0),
                    ),
                    labelColor: Colors.black,
                    labelStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    tabs: _tabList,
                  ),
                ),
              ),
              Container(height: size!.height * 0.65, child: MyTabView()),
            ],
          ),
        ),
      ),
    );
  }
}
