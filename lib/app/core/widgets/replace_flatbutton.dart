import 'package:flutter/material.dart';

class ReplaceFlatButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;

  const ReplaceFlatButton({
    required this.child,
    required this.onPressed,
    this.textColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: child,
      onPressed: () => onPressed(),
      style: TextButton.styleFrom(
        padding: padding,
      ),
    );
  }
}
