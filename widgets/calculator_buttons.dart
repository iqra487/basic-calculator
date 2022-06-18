import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final double textsize;
  Function callback;
  // ignore: use_key_in_widget_constructors
  CalculatorButton(
      {required this.text, required this.textsize, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2.0),
      child: SizedBox(
          width: 70,
          height: 70,
          child: FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            color: const Color.fromARGB(255, 110, 110, 110),
            child: Text(
              text,
              style: TextStyle(fontSize: textsize, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              callback(text);
            },
          )),
    );
  }
}
