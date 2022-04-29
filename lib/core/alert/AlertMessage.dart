import 'package:flutter/material.dart';

class AlertMessage {
  BuildContext context;
  String message;
  AlertMessage({
    Key? key,
    required this.context,
    required this.message,
  });

  void alertMsg() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogAlert(
          msg: message,
          onTap: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}

// ignore: must_be_immutable
class DialogAlert extends StatelessWidget {
  String msg;
  final GestureTapCallback onTap;
  DialogAlert({Key? key, required this.msg, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: onTap,
    );

// Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Alert"),
      content: Text(msg),
      actions: [
        okButton,
      ],
    );

    return alert;
  }
}
