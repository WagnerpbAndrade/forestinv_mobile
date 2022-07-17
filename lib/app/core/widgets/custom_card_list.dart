import 'package:flutter/material.dart';

class CustomCardList extends StatelessWidget {
  final String titulo;
  final String message;

  const CustomCardList({required this.titulo, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Text(
              titulo,
            ),
          ),
          SizedBox(
            child: Text(
              message,
              maxLines: 3,
              textAlign: TextAlign.right,
              style: const TextStyle(
                overflow: TextOverflow.fade,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
