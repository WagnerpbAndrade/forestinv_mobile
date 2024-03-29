import 'package:flutter/material.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';

class CustomButton extends StatefulWidget {
  final Function action;
  final String title;
  final EdgeInsets? margin;
  const CustomButton({
    Key? key,
    required this.action,
    required this.title,
    this.margin,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: widget.margin ?? const EdgeInsets.only(top: 40),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          backgroundColor:
              MaterialStateProperty.all<Color>(ColorsConst.secondary),
        ),
        onPressed: () {
          widget.action();
        },
        child: Text(
          widget.title,
          style: const TextStyle(color: ColorsConst.textColorPrimary),
        ),
      ),
    );
  }
}
