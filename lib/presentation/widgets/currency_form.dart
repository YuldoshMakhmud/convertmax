import 'package:convermax/data/model/currency.dart';
import 'package:convermax/data/service/api_service.dart';
import 'package:flutter/material.dart';
import 'currency_result.dart'; // resultni kurib qilishim uchun

class CurrencyForm extends StatefulWidget {
  @override
  _CurrencyFormState createState() => _CurrencyFormState();
}

class _CurrencyFormState extends State<CurrencyForm> {
  final ApiService apiService = ApiService();
  late Future<List<Currency>> currencies;
  final TextEditingController _amountController = TextEditingController();
  Currency? selectedCurrency;
  double enteredValue = 1.0;

  @override
  void initState() {
    super.initState();
    currencies = apiService.fetchCurrencies();
  }

  void _updateEnteredValue(String value) {
    setState(() {
      enteredValue = double.tryParse(value) ?? 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _amountController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Enter amount',
            border: OutlineInputBorder(),
          ),
          onChanged: _updateEnteredValue,
        ),
        SizedBox(height: 20),
        FutureBuilder<List<Currency>>(
          future: currencies,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No data available'));
            } else {
              return DropdownButton<Currency>(
                hint: Text('Select a currency'),
                value: selectedCurrency,
                isExpanded: true,
                items: snapshot.data!.map((currency) {
                  return DropdownMenuItem<Currency>(
                    value: currency,
                    child: Text(currency.title),
                  );
                }).toList(),
                onChanged: (Currency? value) {
                  setState(() {
                    selectedCurrency = value;
                  });
                },
              );
            }
          },
        ),
        SizedBox(height: 20),
        if (selectedCurrency != null)
          CurrencyResult(
            currency: selectedCurrency!,
            enteredValue: enteredValue,
          ), // Natijani ko'rsatish uchun widget
      ],
    );
  }
}
