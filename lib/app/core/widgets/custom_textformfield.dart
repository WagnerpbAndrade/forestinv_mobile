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
  final TextEditingController? controller;
  final InputBorder? focusBorder;
  final InputBorder? enabledBorder;
  final String? errorText;
  final FormFieldValidator<String>? validator;
  Function? onChange;

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
    this.controller,
    this.focusBorder,
    this.enabledBorder,
    this.errorText,
    this.validator,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        focusedBorder: focusBorder,
        enabledBorder: enabledBorder,
        enabled: enable,
        icon: icon == null ? null : Icon(icon),
        errorText: errorText,
      ),
      maxLines: maxLines,
      maxLength: maxLenght,
      autofocus: autofocus,
      autovalidateMode: autovalidateMode,
      validator: validator,
      onChanged: (value) => onChange!,
    );
  }
}
