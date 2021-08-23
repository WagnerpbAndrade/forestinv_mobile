import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final bool enable;
  final IconData? icon;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final AutovalidateMode? autovalidateMode;
  final bool autofocus;
  final int? maxLines;
  final int? maxLenght;

  CustomTextFormField({
    Key? key,
    required this.label,
    this.enable = true,
    this.icon,
    this.focusNode,
    required this.textInputAction,
    required this.keyboardType,
    this.maxLines,
    this.maxLenght,
    this.autofocus = false,
    this.autovalidateMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
        enabled: enable,
        icon: icon == null ? null : Icon(icon),
      ),
      maxLines: maxLines,
      maxLength: maxLenght,
      autofocus: autofocus,
      autovalidateMode: autovalidateMode,
    );
  }
}
