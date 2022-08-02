import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/stores/grid_photo_store.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class GridViewPhotoPage extends StatefulWidget {
  const GridViewPhotoPage({Key? key}) : super(key: key);

  @override
  State<GridViewPhotoPage> createState() => _GridViewPhotoPageState();
}

class _GridViewPhotoPageState extends State<GridViewPhotoPage> {
  final gridStore = Modular.get<GridPhotoStore>();

  @override
  void initState() {
    if (gridStore.photos.isEmpty) {
      final iconButton = IconButton(
        onPressed: () {
          gridStore.openCamera(context);
        },
        icon: const Icon(Icons.add_a_photo),
      );
      gridStore.photos.add(iconButton);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fotos'),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_) {
          return ResponsiveGridList(
            horizontalGridMargin: 16,
            verticalGridMargin: 16,
            maxItemsPerRow: 3,
            minItemWidth: 100,
            children: List.generate(
              gridStore.photos.length,
              (index) => gridStore.photos.elementAt(index),
            ),
          );
        },
      ),
    );
  }
}
