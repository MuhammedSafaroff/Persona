import 'package:flutter/cupertino.dart';

class MyCupertinoDialog {
  final String? title;
  final Widget? myContent;
  final String? yesButton;
  final Function? yesButtonFun;
  final String? cancelButton;
  final Function? cancelButtonFun;
  final bool? cancelButtonCtrl;
  final BuildContext? context;

  MyCupertinoDialog({
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
    showCupertinoDialog(
      context: context!,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title!),
          content: myContent,
          actions: <Widget>[
            CupertinoDialogAction(
                isDefaultAction: true,
                child: Text(yesButton!),
                onPressed: () => yesButtonFun!()),
            cancelButtonCtrl!
                ? CupertinoDialogAction(
                    child: Text(cancelButton!),
                    onPressed: () => cancelButtonFun!(),
                  )
                : SizedBox.shrink(),
          ],
        );
      },
    );
  }
}
