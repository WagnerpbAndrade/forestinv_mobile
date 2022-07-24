import 'package:flutter/material.dart';

class BuildPage extends StatelessWidget {
  final Color color;
  final String urlImage;
  final String title;
  final String subtitle;

  const BuildPage(
      {Key? key,
      required this.color,
      required this.urlImage,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              urlImage,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            const SizedBox(
              height: 64,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.teal.shade700,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.black26,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
