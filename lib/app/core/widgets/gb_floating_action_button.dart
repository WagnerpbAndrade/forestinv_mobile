import 'package:flutter/material.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';

class GbFloatingActionButton extends StatelessWidget {
  final IconData icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Function onPressed;

  GbFloatingActionButton({
    required this.icon,
    this.backgroundColor,
    this.foregroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(icon),
      backgroundColor: backgroundColor ?? ColorsConst.secundaryColor,
      foregroundColor: foregroundColor ?? ColorsConst.textColorSecundary,
      onPressed: onPressed(),
    );
  }
}
