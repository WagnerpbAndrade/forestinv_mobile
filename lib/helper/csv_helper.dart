import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:forestinv_mobile/helper/extensions.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class CsvHelper {
  String? filePath;

  Future<void> createFile(
      final List<List<dynamic>> rows, final BuildContext context) async {
    final String csv = const ListToCsvConverter().convert(rows);

    await _writeData(csv);

    final box = context.findRenderObject() as RenderBox?;

    final String filePath = await _localPath;

    await Share.shareFiles(
      [filePath],
      mimeTypes: ['text/csv'],
      text: 'Compartilhando exportação do projeto no formato csv.',
      subject: 'ForestInv: Dados exportados',
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/projeto-${DateTime.now().formattedDateExported()}.csv';
  }

  Future<File> _writeData(String csvData) async {
    final String filePath = await _localPath;
    final file = File(filePath);
    return file.writeAsString(csvData);
  }
}
