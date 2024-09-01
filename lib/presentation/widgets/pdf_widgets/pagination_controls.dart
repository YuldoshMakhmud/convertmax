import 'package:flutter/material.dart';

class PaginationControls extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback onNextPressed;
  final VoidCallback onPreviousPressed;

  const PaginationControls({
    Key? key,
    required this.currentPage,
    required this.totalPages,
    required this.onNextPressed,
    required this.onPreviousPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: onPreviousPressed,
            icon: const Icon(Icons.arrow_back),
          ),
          Text('$currentPage / $totalPages'),
          IconButton(
            onPressed: onNextPressed,
            icon: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
