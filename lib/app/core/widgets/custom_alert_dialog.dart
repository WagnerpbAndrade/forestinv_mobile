import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String textNoButton;
  final String textYesButton;
  final Function actionNo;
  final Function actionYes;

  const CustomAlertDialog(
      {Key? key,
      required this.title,
      required this.content,
      required this.textNoButton,
      required this.textYesButton,
      required this.actionNo,
      required this.actionYes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        ElevatedButton(
          child: Text(textNoButton),
          onPressed: () => actionNo(),
        ),
        ElevatedButton(
          child: Text(textYesButton),
          onPressed: () => actionYes(),
        ),
      ],
    );
  }
}
