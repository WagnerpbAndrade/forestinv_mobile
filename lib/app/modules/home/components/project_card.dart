import 'package:flutter/material.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 8,
        child: Row(
          children: [
            const SizedBox(
              height: 100,
              width: 100,
              child: Icon(Icons.three_g_mobiledata),
            ),
            Text(project.nome),
            Text('Alegre - ES'),
          ],
        ),
      ),
    );
  }
}
