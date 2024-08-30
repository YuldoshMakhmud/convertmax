import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'pagination_controls.dart'; // Sahifalash boshqaruvlari uchun import

class PdfViewer extends StatefulWidget {
  final String filePath;

  const PdfViewer({Key? key, required this.filePath}) : super(key: key);

  @override
  _PdfViewerState createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  late PdfController _pdfController;
  int _currentPage = 1;
  int _totalPages = 0;

  @override
  void initState() {
    super.initState();
    _pdfController = PdfController(
      document: PdfDocument.openFile(widget.filePath),
    );

    _pdfController.document.then((doc) {
      setState(() {
        _totalPages = doc.pagesCount;
      });
    });
  }

  @override
  void dispose() {
    _pdfController.dispose(); // Kontrollerni tozalash
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PdfView(
            controller: _pdfController,
            onPageChanged: _onPageChanged,
          ),
        ),
        PaginationControls(
          currentPage: _currentPage,
          totalPages: _totalPages,
          onNextPressed: () {
            if (_currentPage < _totalPages) {
              _pdfController.nextPage(
                curve: Curves.ease,
                duration: const Duration(milliseconds: 200),
              );
            }
          },
          onPreviousPressed: () {
            if (_currentPage > 1) {
              _pdfController.previousPage(
                curve: Curves.ease,
                duration: const Duration(milliseconds: 200),
              );
            }
          },
        ),
      ],
    );
  }
}
