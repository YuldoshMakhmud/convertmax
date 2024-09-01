import 'package:convermax/presentation/widgets/lotin_kiril_widget/lotin_kiril_converter.dart';
import 'package:flutter/material.dart';

class LotinKiril extends StatefulWidget {
  const LotinKiril({super.key});

  @override
  _LotinKirilState createState() => _LotinKirilState();
}

class _LotinKirilState extends State<LotinKiril> {
  String inputText = "";
  String outputText = "";
  bool isToCyrillic = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lotin & Kiril"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Matnni kiriting",
              ),
              onChanged: (text) {
                setState(() {
                  inputText = text;
                  outputText =
                      LotinKirilConverter.convert(inputText, isToCyrillic);
                });
              },
            ),
            const SizedBox(height: 20),
            SwitchListTile(
              title:
                  Text(isToCyrillic ? "Lotindan Kirilga" : "Kirildan Lotinga"),
              value: isToCyrillic,
              onChanged: (bool value) {
                setState(() {
                  isToCyrillic = value;
                  outputText =
                      LotinKirilConverter.convert(inputText, isToCyrillic);
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              "Natija:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              outputText,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
