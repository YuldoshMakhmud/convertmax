import 'package:convermax/presentation/widgets/currency_form.dart';
import 'package:flutter/material.dart';

class CurrencyPage extends StatelessWidget {
  const CurrencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CurrencyForm(),
      ),
    );
  }
}
