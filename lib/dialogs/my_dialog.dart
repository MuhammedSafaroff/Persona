import 'package:flutter/material.dart';

class MyDialog {
  final String? title;
  final Widget? myContent;
  final String? yesButton;
  final Function? yesButtonFun;
  final String? cancelButton;
  final Function? cancelButtonFun;
  final bool? cancelButtonCtrl;
  final BuildContext? context;

  MyDialog({
    this.title,
    this.myContent,
    this.yesButton,
    this.yesButtonFun,
    this.cancelButton,
    this.cancelButtonFun,
    this.cancelButtonCtrl,
    this.context,
  });

  showAlertDialog() {
    showDialog(
      context: context!,
      builder: (context) {
        return AlertDialog(
          title: Text(title!),
          content: myContent,
          actions: <Widget>[
            TextButton(child: Text(yesButton!), onPressed:()=> yesButtonFun!()),
            cancelButtonCtrl!
                ? TextButton(
                    child: Text(cancelButton!), onPressed:()=> cancelButtonFun!())
                : SizedBox.shrink(),
          ],
        );
      },
    );
  }
}
