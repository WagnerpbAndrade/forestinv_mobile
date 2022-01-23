import 'package:flutter/material.dart';
import 'package:forestinv_mobile/app/core/theme/theme_app.dart';

class CustomTextFormField extends StatelessWidget {
  final Function validar;
  final String textError;
  final bool isPassWord;
  final bool valido;
  final String label;
  final Icon icon;
  final TextInputType textType;
  final TextEditingController controller;
  const CustomTextFormField({
    Key? key,
    required this.label,
    required this.icon,
    required this.validar,
    required this.textError,
    required this.valido,
    required this.isPassWord,
    required this.textType,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        height: 80,
        child: TextFormField(
          controller: controller,
          obscureText: isPassWord,
          onChanged: (value) => {validar(value)},
          decoration: InputDecoration(
            errorText: textError == "" ? "" : textError,
            prefixIcon: icon,
            hintText: label,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                width: 0,
                style: !valido ? BorderStyle.none : BorderStyle.solid,
              ),
            ),
            fillColor: ThemeApp.primaryColor.withOpacity(0.2),
          ),
          cursorColor: ThemeApp.primaryColor,
          keyboardType: textType,
        ),
      ),
    );
  }
}
