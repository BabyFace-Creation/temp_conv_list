import 'package:flutter/material.dart';
import 'Input.dart';
import 'Output.dart';
import 'HistoryConvert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
// This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _result = 0;
  double _inputUser = 0;
  String _newValue = "Kelvin";
  int count = 1;
  List<String> listViewItem = <String>[];
  var listItem = ["Kelvin", "Reamur"];
  final inputCont = TextEditingController();

  void perhitunganSuhu() {
    setState(() {
      _inputUser = double.parse(inputCont.text);
      if (_newValue == "Kelvin")
        _result = _inputUser + 273.15;
      else
        _result = (4 / 5) * _inputUser;
      _result = num.parse(_result.toStringAsFixed(2));
      listViewItem.add("$count. $_newValue : $_result");
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Converter Suhu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              Input(inputCont: inputCont),
              DropdownButton<String>(
                items: listItem.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: _newValue,
                onChanged: (String changeValue) {
                  setState(() {
                    _newValue = changeValue;
                    _inputUser = double.parse(inputCont.text);
                    perhitunganSuhu();
                  });
                },
              ),
              Container(
                  child: Output(
                result: _result,
              )),
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: RaisedButton(
                  child: Text('Konversi'),
                  color: Colors.blue,
                  onPressed: perhitunganSuhu,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Riwayat Konversi",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              HistoryConvert(listViewItem: listViewItem),
            ],
          ),
        ),
      ),
    );
  }
}
