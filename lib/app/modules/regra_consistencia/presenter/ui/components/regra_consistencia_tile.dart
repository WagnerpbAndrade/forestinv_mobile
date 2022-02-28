import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/domain/entities/regra_consistencia.dart';
import 'package:forestinv_mobile/app/modules/regra_consistencia/presenter/outputs/stores/regra_consistencia_store.dart';
import 'package:toggle_switch/toggle_switch.dart';

class RegraConsistenciaTile extends StatelessWidget {
  RegraConsistenciaTile({required this.regra, this.onTap});

  final RegraConsistencia regra;
  final Function? onTap;

  final store = Modular.get<RegraConsistenciaStore>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('CArd');
      },
      child: Container(
        height: 135,
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 8,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ToggleSwitch(
                  minWidth: 30.0,
                  cornerRadius: 20.0,
                  activeBgColors: [
                    const [ColorsConst.secondary],
                    [Colors.red[800]!]
                  ],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  initialLabelIndex: regra.isActive() ? 0 : 1,
                  totalSwitches: 2,
                  //labels: const ['True', 'False'],
                  radiusStyle: false,
                  onToggle: (index) {
                    print('switched to: $index');
                    regra.ativoInativoEnum =
                        AtivoInativoEnum.values.elementAt(index!);
                    store.updateStatus(regra);
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  child: Text(
                    regra.descricao!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSingleCheckBox(final RegraConsistencia regra) => GestureDetector(
        onTap: () {
          print('Qualquer coisa');
          print(
              '${ValidacaoConsistenciaEnum.values.elementAt(regra.tipo!.index)}');
        },
        child: Checkbox(
          activeColor: ColorsConst.primary,
          value: true,
          onChanged: (value) {},
          //value: AtivoInativoEnum.values.elementAt(regra.ativoInativoEnum!.index),
          //onChanged: (int value) => checkboxState.value = value!,
        ),
      );
}
