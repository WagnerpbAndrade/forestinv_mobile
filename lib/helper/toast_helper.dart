import 'package:flutter/cupertino.dart';
import 'package:toast/toast.dart';

class ToastHelper {
  void init(final BuildContext context) {
    ToastContext().init(context);
  }

  void show(String msg, {int? duration, int? gravity}) {
    Toast.show(msg, duration: duration, gravity: gravity);
  }
}
