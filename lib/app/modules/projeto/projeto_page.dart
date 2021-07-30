import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forestinv_mobile/app/core/widgets/gb_floating_action_button.dart';
import 'package:forestinv_mobile/app/modules/projeto/constants/ui_text.dart';
import 'package:forestinv_mobile/app/modules/projeto/projeto_store.dart';
import 'package:flutter/material.dart';

class ProjetoPage extends StatefulWidget {
  @override
  ProjetoPageState createState() => ProjetoPageState();
}

class ProjetoPageState extends State<ProjetoPage> {
  final ProjetoStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(UIText.PROJECT_UI_TEXT),
          centerTitle: true,
        ),
        body: SafeArea(
          child: ListView.builder(
            itemCount: 50,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Projeto $index'),
              );
            },
          ),
        ),
        floatingActionButton: GbFloatingActionButton(
          onPressed: () {},
          icon: Icons.add,
        ));
  }
}
