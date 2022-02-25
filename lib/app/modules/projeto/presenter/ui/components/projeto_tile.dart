import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:forestinv_mobile/app/modules/projeto/domain/entities/project.dart';
import 'package:forestinv_mobile/helper/extensions.dart';

class ProjetoTile extends StatelessWidget {
  final Project projeto;

  const ProjetoTile({required this.projeto});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
              SizedBox(
                height: 70,
                width: 70,
                child: CachedNetworkImage(
                  imageUrl:
                      'https://static.thenounproject.com/png/194055-200.png',
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        projeto.nome,
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Área: ${projeto.area.toString()} ha',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${projeto.visibilidadeProjetoEnum.toUpperCase()} - '
                        '${projeto.dataCriacao!.formattedDate()}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
