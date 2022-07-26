import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function? onPressed;
  final Widget child;
  final MaterialStateProperty<Color?>? backgroundColor;
  final ButtonStyle? style;

  const CustomElevatedButton({
    required this.onPressed,
    this.backgroundColor,
    required this.child,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 12),
      child: ElevatedButton(
        style: style ??
            ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              elevation: MaterialStateProperty.all(0),
            ),
        onPressed: onPressed == null ? null : () => onPressed!(),
        child: child,
      ),
    );
  }
}
