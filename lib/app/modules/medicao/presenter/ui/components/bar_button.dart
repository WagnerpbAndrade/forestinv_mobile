import 'package:flutter/material.dart';

class BarButton extends StatelessWidget {
  final String label;
  final BoxDecoration decoration;
  final VoidCallback onTap;

  const BarButton(
      {required this.label, required this.decoration, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          decoration: decoration,
          height: 40,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
