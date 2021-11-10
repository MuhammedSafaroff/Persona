import 'dart:io';

import 'package:flutter/widgets.dart';

import 'my_cupertino_dialog.dart';
import 'my_dialog.dart';

class DialogPlatformCtrl {
  final String title;
  final Widget myContent;
  final String yesButton;
  final Function yesButtonFun;
  final String? cancelButton;
  final Function? cancelButtonFun;
  final bool cancelButtonCtrl;
  final BuildContext context;

  DialogPlatformCtrl({
    required this.title,
    required this.myContent,
    required this.yesButton,
    required this.yesButtonFun,
    this.cancelButton,
    this.cancelButtonFun,
    this.cancelButtonCtrl = false,
    required this.context,
  });
  void platformCtrlDialog() {
    if (Platform.isIOS) {
      MyCupertinoDialog(
        title: title,
        myContent: myContent,
        yesButton: yesButton,
        yesButtonFun: yesButtonFun,
        cancelButton: cancelButton!,
        cancelButtonFun: cancelButtonFun!,
        cancelButtonCtrl: cancelButtonCtrl,
        context: context,
      ).showAlertDialog();
    } else if (Platform.isAndroid) {
      MyDialog(
        title: title,
        myContent: myContent,
        yesButton: yesButton,
        yesButtonFun: yesButtonFun,
        cancelButton: cancelButton!,
        cancelButtonFun: cancelButtonFun!,
        cancelButtonCtrl: cancelButtonCtrl,
        context: context,
      ).showAlertDialog();
    }
  }
}
