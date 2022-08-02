import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class DetailPhotoPage extends StatelessWidget {
  final String imagePath;
  const DetailPhotoPage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Foto'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          height: 1000,
          child: PhotoView(
            filterQuality: FilterQuality.high,
            backgroundDecoration: const BoxDecoration(),
            imageProvider: AssetImage(imagePath),
          ),
        ),
      ),
    );
  }
}
