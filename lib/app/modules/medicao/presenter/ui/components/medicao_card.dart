import 'package:flutter/material.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/entities/medicao.dart';
import 'package:forestinv_mobile/helper/extensions.dart';

class MedicaoCard extends StatelessWidget {
  const MedicaoCard({
    required this.medicao,
    required this.onTap,
    required this.onPressedUpdate,
    required this.onPressedDelete,
  });

  final Medicao medicao;
  final Function onTap;
  final Function onPressedUpdate;
  final Function onPressedDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0, left: 16),
                  child: Text(
                    'Medição',
                    style: TextStyle(
                      color: ColorsConst.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    height: 100,
                    width: 100,
                    child: Icon(
                      Icons.calculate,
                      color: ColorsConst.primary,
                      size: 48,
                    ),
                  ),
                  Expanded(
                      child: Text(
                    'Data de conclusão: ${medicao.dataMedicao!.formattedDate()}',
                    style: const TextStyle(
                      color: ColorsConst.secondary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                  Expanded(
                    child: Text(
                      'Responsável: ${medicao.nomeResponsavel}',
                      style: const TextStyle(
                        color: ColorsConst.secondary,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () => onPressedUpdate(),
                        icon: const Icon(
                          Icons.edit,
                          color: ColorsConst.primary,
                        ),
                      ),
                      IconButton(
                        onPressed: () => onPressedDelete(),
                        icon: const Icon(
                          Icons.close_outlined,
                          color: ColorsConst.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text(
              //         'Estado da árvore: ${medicao.estadoArvore}',
              //         style: const TextStyle(
              //           color: ColorsConst.primary,
              //           fontSize: 14,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       )
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
