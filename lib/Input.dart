import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  const Input({
    Key key,
    @required this.inputCont,
  }) : super(key: key);

  final TextEditingController inputCont;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputCont,
      decoration: InputDecoration(labelText: 'Masukkan Suhu Dalam Celcius'),
      keyboardType:
          TextInputType.numberWithOptions(decimal: true, signed: false),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9+\.]'))
      ],
    );
  }
}
