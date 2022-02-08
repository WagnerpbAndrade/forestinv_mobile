import 'package:flutter/material.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/entities/parcela.dart';

class ParcelaCard extends StatelessWidget {
  const ParcelaCard({required this.parcela, required this.onTap});

  final Parcela parcela;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 100,
                width: 100,
                child: Icon(Icons.three_g_mobiledata),
              ),
              Text(parcela.numero.toString()),
              Expanded(
                child: Text('Área: ${parcela.area.toStringAsFixed(2)}'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
