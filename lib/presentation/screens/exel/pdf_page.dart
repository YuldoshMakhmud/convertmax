import 'package:convermax/presentation/widgets/exel_widgets/exel_picker_button.dart';
import 'package:convermax/presentation/widgets/exel_widgets/exel_viewer.dart';
import 'package:convermax/presentation/widgets/pdf_widgets/pdf_picker_button.dart';
import 'package:convermax/presentation/widgets/pdf_widgets/pdf_viwer.dart';
import 'package:flutter/material.dart';
// Excel ko'rish uchun import

class PdfPage extends StatefulWidget {
  const PdfPage({super.key});

  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  String? _pdfFilePath; // PDF Fayl yo'li uchun o'zgaruvchi
  String? _excelFilePath; // Excel Fayl yo'li uchun o'zgaruvchi

  void _onPdfFilePicked(String? filePath) {
    setState(() {
      _pdfFilePath = filePath;
    });
  }

  void _onExcelFilePicked(String? filePath) {
    setState(() {
      _excelFilePath = filePath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pdf & Exel"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PdfPickerButton(
                onFilePicked: _onPdfFilePicked), // PDF yuklash tugmasi
            ExcelPickerButton(
                onFilePicked: _onExcelFilePicked), // Excel yuklash tugmasi
            const SizedBox(height: 20),
            // PDF yoki Excel fayl tanlangan bo'lsa, ularni ko'rsatadi
            _pdfFilePath != null
                ? Expanded(
                    child: PdfViewer(
                        filePath: _pdfFilePath!), // PDF ko'ruvchi vidjet
                  )
                : _excelFilePath != null
                    ? Expanded(
                        child: ExcelViewer(
                            filePath:
                                _excelFilePath!), // Excel ko'ruvchi vidjet
                      )
                    : const Text('Iltimos, PDF yoki Excel faylni yuklang.'),
          ],
        ),
      ),
    );
  }
}
