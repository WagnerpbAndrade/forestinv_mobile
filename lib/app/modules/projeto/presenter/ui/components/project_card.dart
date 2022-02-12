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
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 8,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(
                      'assets/images/tree_icon.png',
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  Expanded(
                      child: Text(
                    project.nome,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: ColorsConst.secondary,
                    ),
                  )),
                  Expanded(
                    child: Text(
                      'Área: ${project.area.toStringAsFixed(2)} ha',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ColorsConst.secondary,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
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
        ),
      ),
    );
  }
}
