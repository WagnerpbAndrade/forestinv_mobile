import 'package:flutter/material.dart';

class CustomSnackbar {
  CustomSnackbar({
    required String message,
    required Color color,
    required Color textColor,
    required String label,
    Function? onPressed,
    int durationInSeconds = 4,
  }) {
    SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: label,
        textColor: textColor,
        onPressed: () => onPressed,
      ),
      backgroundColor: color,
      duration: Duration(seconds: durationInSeconds),
    );
  }
}
