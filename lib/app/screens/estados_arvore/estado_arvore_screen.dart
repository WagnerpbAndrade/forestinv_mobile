import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class EstadoArvoreScreen extends StatelessWidget {
  const EstadoArvoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fluxograma de estado da árvore'),
      ),
      body: Container(
        child: PhotoView(
          imageProvider: const AssetImage('assets/images/estados_arvore.png'),
        ),
      ),
    );
  }
}
