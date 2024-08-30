import 'package:convermax/presentation/widgets/pdf_picker_button.dart';
import 'package:convermax/presentation/widgets/pdf_viwer.dart';
import 'package:flutter/material.dart';

class PdfPage extends StatefulWidget {
  const PdfPage({super.key});

  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  String? _filePath; // Fayl yo'li uchun o'zgaruvchi

  void _onFilePicked(String? filePath) {
    setState(() {
      _filePath = filePath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PdfPickerButton(onFilePicked: _onFilePicked), // PDF yuklash tugmasi
            const SizedBox(height: 20),
            // PDF fayl tanlangan bo'lsa, uni ko'rsatadi
            _filePath != null
                ? Expanded(
                    child:
                        PdfViewer(filePath: _filePath!), // PDF ko'ruvchi vidjet
                  )
                : const Text('Iltimos, PDF faylni yuklang.'),
          ],
        ),
      ),
    );
  }
}
