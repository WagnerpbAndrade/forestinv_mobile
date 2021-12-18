import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function onPressed;
  final Widget child;
  final MaterialStateProperty<Color?>? backgroundColor;
  final ButtonStyle style;

  const CustomElevatedButton({
    required this.onPressed,
    this.backgroundColor,
    required this.child,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: child,
      style: style,
    );
  }
}
