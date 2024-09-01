import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class ExcelPickerButton extends StatelessWidget {
  final Function(String?) onFilePicked;

  const ExcelPickerButton({Key? key, required this.onFilePicked})
      : super(key: key);

  Future<void> _pickExcelFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls'],
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
      onPressed: _pickExcelFile,
      child: const Text(
        'Excel Fayl Yuklash',
        style: TextStyle(
          fontSize: 24,
          color: Colors.green,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
