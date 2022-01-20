import 'package:flutter/material.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';

class ProjetoPage extends StatefulWidget {
  final Project project;

  const ProjetoPage({required this.project});
  @override
  ProjetoPageState createState() => ProjetoPageState();
}

class ProjetoPageState extends State<ProjetoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.project.nome),
      ),
      body: Container(),
    );
  }
}
