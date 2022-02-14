import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/entities/checkbox_state.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/entities/regra_consistencia.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/presenter/outputs/controllers/regra_consistencia_controller.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/presenter/outputs/stores/regra_consistencia_store.dart';

class RegraConsistenciaPage extends StatefulWidget {
  @override
  RegraConsistenciaPageState createState() => RegraConsistenciaPageState();
}

class RegraConsistenciaPageState extends State<RegraConsistenciaPage> {
  final RegraConsistenciaStore store = Modular.get();
  final regraController = Modular.get<RegraConsistenciaController>();

  //final allRules = CheckboxState(title: 'Habilitar todas as regras');

  // final rules = [
  //   CheckboxState(title: 'Regra 1'),
  //   CheckboxState(title: 'Regra 2'),
  //   CheckboxState(title: 'Regra 3'),
  //   CheckboxState(title: 'Regra 4'),
  //   CheckboxState(title: 'Regra 5'),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Regras de Consistência'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<RegraConsistencia>>(
          future: regraController.getAllRegrasByUser(),
          builder: (_, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return const Center(
                  child: Text('Oops! Algo deu errado. Tente novamente!'));
            }
            final List<RegraConsistencia> rules =
                snapshot.data as List<RegraConsistencia>;
            regraController.setRules(rules);

            return ListView.builder(
                itemCount: rules.length,
                itemBuilder: (_, index) {
                  buildGroupCheckBox(regraController.allRules);
                  const Divider(color: Colors.black54);
                  return Column(
                    children: [
                      buildSingleCheckBox(CheckboxState(
                          title: rules[index].descricao!,
                          value: rules[index].ativoInativoEnum == 'SIM'))
                    ],
                  );
                });
          }),
    );
  }

  Widget buildSingleCheckBox(final CheckboxState checkboxState) =>
      GestureDetector(
        onTap: () {
          print('${checkboxState.title}');
        },
        child: CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: ColorsConst.primary,
          value: checkboxState.value,
          title: Text(checkboxState.title),
          onChanged: (value) => checkboxState.value = value!,
        ),
      );

  Widget buildGroupCheckBox(final CheckboxState checkboxState) =>
      CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: ColorsConst.primary,
        value: checkboxState.value,
        title: Text(checkboxState.title),
        onChanged: toggleGroupCheckBox,
      );

  void toggleGroupCheckBox(bool? value) {
    if (value == null) return;

    setState(() {
      regraController.allRules.value = value;
      regraController.rules.forEach((rule) => rule.value = value);
    });
  }
}
