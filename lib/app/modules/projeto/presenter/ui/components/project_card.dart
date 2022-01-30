import 'package:flutter/material.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    required this.project,
    required this.onTap,
    required this.onPressedUpdate,
    required this.onPressedDelete,
  });

  final Project project;
  final Function onTap;
  final Function onPressedUpdate;
  final Function onPressedDelete;

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
              Expanded(child: Text(project.nome)),
              Expanded(
                child: Text('Área: ${project.area.toStringAsFixed(2)}'),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () => onPressedUpdate(),
                    icon: const Icon(
                      Icons.edit,
                      color: ColorsConst.error,
                    ),
                  ),
                  IconButton(
                    onPressed: () => onPressedDelete(),
                    icon: const Icon(
                      Icons.close_outlined,
                      color: ColorsConst.error,
                    ),
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
