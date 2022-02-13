import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/presenter/outputs/controllers/regra_consistencia_controller.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/presenter/outputs/stores/regra_consistencia_store.dart';

class RegraConsistenciaPage extends StatefulWidget {
  final String title;
  const RegraConsistenciaPage({Key? key, this.title = 'RegraConsistenciaPage'})
      : super(key: key);
  @override
  RegraConsistenciaPageState createState() => RegraConsistenciaPageState();
}

class RegraConsistenciaPageState extends State<RegraConsistenciaPage> {
  final RegraConsistenciaStore store = Modular.get();
  final regraController = Modular.get<RegraConsistenciaController>();

  @override
  void initState() {
    super.initState();
    regraController.getAllRegrasByUser();
  }

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
