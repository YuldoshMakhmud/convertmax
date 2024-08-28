import 'package:convermax/presentation/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Text(""),
        title: const Text(
          'Converter',
          style: TextStyle(color: Colors.amber),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(child: BottomNavigationBarExample()),
    );
  }
}
