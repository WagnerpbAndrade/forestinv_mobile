import 'package:flutter/material.dart';
import 'package:forestinv_mobile/app/modules/medicao/domain/entities/medicao.dart';

class MedicaoCard extends StatelessWidget {
  const MedicaoCard({required this.medicao, required this.onTap});

  final Medicao medicao;
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
              Text(medicao.nomeResponsavel),
              Expanded(
                child: Text('Número: ${medicao.numArvore}'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
