import 'package:forestinv_mobile/app/modules/projeto/constants/ui_text.dart';
import 'package:flutter/material.dart';

class ProjetoPage extends StatefulWidget {
  @override
  ProjetoPageState createState() => ProjetoPageState();
}

class ProjetoPageState extends State<ProjetoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(UIText.PROJECT_UI_TEXT),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
