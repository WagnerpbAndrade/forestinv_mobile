import 'package:flutter/material.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';

class CustomTextFormField extends StatelessWidget {
  final Function? onChanged;
  final Function? validator;
  final String textError;
  final bool isPassWord;
  final bool valido;
  final String label;
  final Icon? icon;
  final TextInputType textType;
  final TextEditingController controller;
  final double? width;
  final InputDecoration? decoration;
  final Function? onTap;
  final bool? readOnly;

  const CustomTextFormField({
    Key? key,
    required this.label,
    this.icon,
    this.onChanged,
    required this.textError,
    required this.valido,
    this.isPassWord = false,
    required this.textType,
    required this.controller,
    this.validator,
    this.width,
    this.decoration,
    this.readOnly,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap != null
          ? () => onTap!()
          : () {
              final FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        height: MediaQuery.of(context).size.height * 0.1,
        width: width ?? double.infinity,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator == null ? null : (value) => validator!(value),
          controller: controller,
          obscureText: isPassWord,
          onChanged: onChanged == null ? null : (value) => onChanged!(value),
          decoration: decoration ??
              InputDecoration(
                errorText: textError == "" ? "" : textError,
                prefixIcon: icon,
                label: Text(label),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    width: 0,
                    style: !valido ? BorderStyle.none : BorderStyle.solid,
                  ),
                ),
                fillColor: ColorsConst.primary.withOpacity(0.1),
              ),
          cursorColor: ColorsConst.primary,
          keyboardType: textType,
          readOnly: readOnly ?? false,
        ),
      ),
    );
  }
}
