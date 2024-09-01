import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class PdfPickerButton extends StatelessWidget {
  final Function(String?) onFilePicked;

  const PdfPickerButton({Key? key, required this.onFilePicked})
      : super(key: key);

  Future<void> _pickPdfFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      final filePath = result.files.single.path;
      onFilePicked(filePath);
    } else {
      onFilePicked(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: _pickPdfFile,
      child: const Text(
        'PDF Fayl Yuklash',
        style: TextStyle(
          fontSize: 24,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
