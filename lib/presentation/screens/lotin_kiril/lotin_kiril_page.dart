import 'package:convermax/presentation/widgets/lotin_kiril_converter.dart';
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
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
            SizedBox(height: 20),
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
            SizedBox(height: 20),
            Text(
              "Natija:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              outputText,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
