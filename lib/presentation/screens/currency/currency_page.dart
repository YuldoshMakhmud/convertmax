import 'package:convermax/presentation/widgets/currency_widget/currency_form.dart';
import 'package:flutter/material.dart';

class CurrencyPage extends StatelessWidget {
  const CurrencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currency"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: CurrencyForm(),
      ),
    );
  }
}
