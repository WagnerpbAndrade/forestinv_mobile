import 'package:flutter/material.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:photo_view/photo_view.dart';

class EstadoArvoreScreen extends StatelessWidget {
  const EstadoArvoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fluxograma de estado da árvore'),
      ),
      body: SafeArea(
        child: Container(
          height: 1000,
          color: ColorsConst.secondary,
          child: PhotoView(
            filterQuality: FilterQuality.high,
            backgroundDecoration: const BoxDecoration(
              color: Colors.white,
            ),
            imageProvider: const AssetImage('assets/images/estados_arvore.png'),
          ),
        ),
      ),
    );
  }
}
