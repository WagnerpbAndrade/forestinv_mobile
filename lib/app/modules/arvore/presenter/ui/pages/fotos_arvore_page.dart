import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class FotosArvorePage extends StatelessWidget {
  final List<String> photos;
  const FotosArvorePage({Key? key, required this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fotos'),
        centerTitle: true,
      ),
      body: ResponsiveGridList(
        horizontalGridMargin: 16,
        verticalGridMargin: 16,
        maxItemsPerRow: 3,
        minItemWidth: 1000,
        children: List.generate(
          photos.length,
          (index) => Image.network(photos.elementAt(index)),
        ),
      ),
    );
  }
}
