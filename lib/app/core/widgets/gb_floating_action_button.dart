import 'package:flutter/material.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';

class GbFloatingActionButton extends StatelessWidget {
  final IconData icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Function onPressed;

  const GbFloatingActionButton({
    required this.icon,
    this.backgroundColor,
    this.foregroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(icon),
      backgroundColor: backgroundColor ?? ColorsConst.secondary,
      foregroundColor: foregroundColor ?? ColorsConst.textColorPrimary,
      onPressed: () => onPressed(),
    );
  }
}
