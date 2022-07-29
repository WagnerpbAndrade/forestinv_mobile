import 'package:flutter/material.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/entities/parcela.dart';

class ParcelaCard extends StatelessWidget {
  const ParcelaCard({
    required this.parcela,
    required this.onTap,
    required this.onPressedUpdate,
    required this.onPressedDelete,
  });

  final Parcela parcela;
  final Function onTap;
  final Function onPressedUpdate;
  final Function onPressedDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
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
                    'Parcela',
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
                      Icons.crop_square_rounded,
                      color: ColorsConst.primary,
                      size: 64,
                    ),
                  ),
                  Expanded(
                      child: Text(
                    parcela.identificadorParcela.toString(),
                    style: const TextStyle(
                      color: ColorsConst.secondary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                  Expanded(
                    child: Text(
                      'Área: ${parcela.areaParcela.toStringAsFixed(2)}',
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
            ],
          ),
        ),
      ),
    );
  }
}
