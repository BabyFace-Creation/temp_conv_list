import 'package:flutter/material.dart';
import 'Input.dart';
import 'Output.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
// This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double input;
  double _result = 0;
  double _inputUser = 0;
  String _newValue;
  int count = 0;
  List<String> listViewItem = List<String>();
  var listItem = ["Kelvin", "Reamur"];
  final inputCont = TextEditingController();

  void perhitunganSuhu() {
    setState(() {
      _inputUser = double.parse(inputCont.text);
      listViewItem[count] = "$_newValue : $_result";
      count++;
      if (_newValue == "Kelvin")
        _result = _inputUser + 273;
      else
        _result = (4 / 5) * _inputUser;
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
                value: listItem[0],
                onChanged: (String changeValue) {
                  setState(() {
                    _newValue = changeValue;
                    _inputUser = double.parse(inputCont.text);
                    if (_newValue == "Kelvin")
                      _result = _inputUser + 273;
                    else
                      _result = (4 / 5) * _inputUser;
                  });
                  perhitunganSuhu();
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
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
