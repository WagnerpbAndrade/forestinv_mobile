import 'package:flutter/material.dart';
import 'package:forestinv_mobile/app/core/theme/theme_app.dart';

class CustomButton extends StatefulWidget {
  final Function action;
  final String title;
  const CustomButton({Key? key, required this.action, required this.title})
      : super(key: key);

  @override
  State<CustomButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 40),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          backgroundColor:
              MaterialStateProperty.all<Color>(ThemeApp.pricipalButtonColor),
        ),
        onPressed: () {
          widget.action();
        },
        child: Text(
          widget.title,
          style: const TextStyle(color: ThemeApp.colorOnPrimary),
        ),
      ),
    );
  }
}
