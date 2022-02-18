import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:forestinv_mobile/app/modules/arvore/presenter/outputs/stores/arvore_store.dart';

class ArvorePage extends StatefulWidget {
  final String title;
  const ArvorePage({Key? key, this.title = 'ArvorePage'}) : super(key: key);
  @override
  ArvorePageState createState() => ArvorePageState();
}

class ArvorePageState extends State<ArvorePage> {
  final ArvoreStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
