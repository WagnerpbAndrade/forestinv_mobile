import 'package:flutter/material.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      height: 120,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const Icon(
            Icons.person,
            color: Colors.white,
            size: 35,
          ),
          Expanded(
            child: Text(
              'ForestInv',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Text(
              'forestinv.app@gmail.com',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
