import 'package:convermax/presentation/screens/currency/currency_page.dart';
import 'package:convermax/presentation/screens/exel/pdf_page.dart';
import 'package:convermax/presentation/screens/lotin_kiril/lotin_kiril_page.dart';
import 'package:flutter/material.dart';

class HomeCenter extends StatelessWidget {
  const HomeCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CurrencyPage(), // CurrencyPage ga o'tish
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(20.0),
                margin: const EdgeInsets.only(bottom: 20.0),
                color: Colors.blue,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.currency_exchange, color: Colors.white),
                    SizedBox(width: 10),
                    Text('Currency Page',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LotinKiril(), // LotinKiril ga o'tish
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(20.0),
                margin: const EdgeInsets.only(bottom: 20.0),
                color: Colors.green,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.translate, color: Colors.white),
                    SizedBox(width: 10),
                    Text('Lotin & Kiril',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PdfPage(), // PdfPage ga o'tish
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(20.0),
                color: Colors.red,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.picture_as_pdf, color: Colors.white),
                    SizedBox(width: 10),
                    Text('PDF Page', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
