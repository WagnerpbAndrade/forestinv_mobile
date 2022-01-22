import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:forestinv_mobile/app/modules/parcela/presenter/output/parcela_store.dart';

class ParcelaPage extends StatefulWidget {
  final String title;
  const ParcelaPage({Key? key, this.title = 'ParcelaPage'}) : super(key: key);
  @override
  ParcelaPageState createState() => ParcelaPageState();
}

class ParcelaPageState extends State<ParcelaPage> {
  final ParcelaStore store = Modular.get();

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
