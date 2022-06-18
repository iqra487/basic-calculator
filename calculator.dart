import 'package:cal/widgets/calculator_buttons.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator();

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  late int firstnum;
  late int secondnum;
  late String res;
  late String displaytxt;
  late String operator;
  late String history;

  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() => _expression += text);
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Calculator"),
          backgroundColor: Color.fromARGB(255, 44, 44, 44),
        ),
        backgroundColor: Color.fromARGB(255, 236, 231, 231),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      _history,
                      style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 130, 125, 125),
                      ),
                    ),
                  )),
              Container(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      _expression,
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                      ),
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: 'AC',
                    textsize: 24,
                    callback: allClear,
                  ),
                  CalculatorButton(
                    text: 'C',
                    textsize: 30,
                    callback: clear,
                  ),
                  CalculatorButton(
                    text: 'DEL',
                    textsize: 20,
                    callback: clear,
                  ),
                  CalculatorButton(
                    text: '/',
                    textsize: 30,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '7',
                    textsize: 30,
                    callback: numClick,
                  ),
                  CalculatorButton(text: '8', textsize: 30, callback: numClick),
                  CalculatorButton(text: '9', textsize: 30, callback: numClick),
                  CalculatorButton(text: '*', textsize: 30, callback: numClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(text: '4', textsize: 30, callback: numClick),
                  CalculatorButton(text: '5', textsize: 30, callback: numClick),
                  CalculatorButton(text: '6', textsize: 30, callback: numClick),
                  CalculatorButton(text: '-', textsize: 30, callback: numClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(text: '1', textsize: 30, callback: numClick),
                  CalculatorButton(text: '2', textsize: 30, callback: numClick),
                  CalculatorButton(text: '3', textsize: 30, callback: numClick),
                  CalculatorButton(text: '+', textsize: 30, callback: numClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '+/-',
                    textsize: 20,
                    callback: numClick,
                  ),
                  CalculatorButton(text: '0', textsize: 30, callback: numClick),
                  CalculatorButton(
                      text: '00', textsize: 30, callback: numClick),
                  CalculatorButton(
                    text: '=',
                    textsize: 30,
                    callback: evaluate,
                  ),
                ],
              )
            ]),
          ),
        ));
  }
}
