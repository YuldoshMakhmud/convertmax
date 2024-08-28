import 'package:convermax/data/model/currency.dart';
import 'package:flutter/material.dart';

class CurrencyResult extends StatelessWidget {
  final Currency currency;
  final double enteredValue;

  CurrencyResult({required this.currency, required this.enteredValue});

  // Kiritilgan miqdorga ko'ra valyutani hisoblash funksiyasi
  double _calculateCurrency(String cbPrice) {
    double price = double.tryParse(cbPrice) ?? 0.0;
    return price * enteredValue;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selected Currency: ${currency.title}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Code: ${currency.code}'),
            Text('Date: ${currency.date}'),
            SizedBox(height: 10),
            Text(
              'Calculated Value: ${_calculateCurrency(currency.cbPrice).toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16, color: Colors.blueAccent),
            ),
          ],
        ),
      ),
    );
  }
}
