import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'dart:io';

class ExcelViewer extends StatelessWidget {
  final String filePath;

  const ExcelViewer({Key? key, required this.filePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      final bytes = File(filePath).readAsBytesSync();

      // Faylni to'g'ri yuklanganda davom etadi
      final excel = Excel.decodeBytes(bytes);

      // Dastlabki jadvalni olish
      final sheet = excel.tables.keys.isNotEmpty
          ? excel.tables[excel.tables.keys.first]
          : null;

      if (sheet == null) {
        return const Center(child: Text('Jadval topilmadi.'));
      }

      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: sheet.rows.first
              .map((cell) =>
                  DataColumn(label: Text(cell?.value.toString() ?? '')))
              .toList(),
          rows: sheet.rows
              .skip(1)
              .map(
                (row) => DataRow(
                  cells: row
                      .map(
                        (cell) => DataCell(Text(cell?.value.toString() ?? '')),
                      )
                      .toList(),
                ),
              )
              .toList(),
        ),
      );
    } catch (e) {
      // Xatolikni qaytarish
      return Center(
        child: Text('Faylni yuklashda xatolik: ${e.toString()}'),
      );
    }
  }
}
