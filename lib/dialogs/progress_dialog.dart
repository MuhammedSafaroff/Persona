import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressAlertDialog {
  final BuildContext context;

  ProgressAlertDialog(this.context);
  showProgressAlertDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext buildcontext) {
        return AlertDialog(
          title: Text('Xahiş olunur gözləyin..'),
          content: Container(
            width: 60,
            height: 60,
            child: Center(
              child: SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
          ),
        );
      },
    );
    return context;
  }
}
