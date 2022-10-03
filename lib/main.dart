import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  @override
  State<SimpleCalculator> createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String equation = "0";
  String result = "0";
  String expression = "";
  String operand1="";
  String operand2="";
  var c = 0;
  var d = 0;
  var count = 0;

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "";
        result = "0";
        operand2="";
        operand1="";
        expression="";
        count = 0;
      } else if (buttonText == "=") {
        result = d.toString();
        // equation = "0";
        // operand2="";
        // operand1="";
        // expression="";
      } else {
        if (equation == "0") {
          equation = buttonText;

        } else {
          if (buttonText == '+') {
            c = int.parse(equation);
            // operand2=c.toString();
            expression = buttonText;

            // equation = equation + buttonText;
            equation = '';
            count = count+1;
            return;
          } else
            equation = equation + buttonText;
          if(count==0){
            operand1=equation;
          }
          else{
            operand2 = equation;
          }

          d = c + int.parse(equation);

        }
      }
    });
  }

  Widget buildButton(
      String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      child: TextButton(
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.normal,
                color: Colors.white),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Colors.black, Colors.indigo])),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                child: Text(
                  result,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                  ),
                ),
              ),

              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                child: Text(
                  operand1+expression+operand2,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                  ),
                ),
              ),
              Expanded(child: Divider()),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(190, 49),
                                primary: Colors.black,
                                shape: RoundedRectangleBorder(
                                    //to set border radius to button
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              child: Text("(", style: TextStyle(fontSize: 25)),
                              onPressed: () => buttonPressed("("),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(190, 49),
                                primary: Colors.black,
                                shape: RoundedRectangleBorder(
                                    //to set border radius to button
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              child: Text(")", style: TextStyle(fontSize: 25)),
                              onPressed: () => buttonPressed(")"),
                            ),
                          ]))
                ],
              ),
              Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Table(
                          children: [
                            TableRow(
                              children: [
                                buildButton("7", 1, Colors.black54),
                                buildButton("8", 1, Colors.black54),
                                buildButton("9", 1, Colors.black54),
                              ],
                            ),
                            TableRow(children: [
                              buildButton("4", 1, Colors.black54),
                              buildButton("5", 1, Colors.black54),
                              buildButton("6", 1, Colors.black54),
                            ]),
                            TableRow(children: [
                              buildButton("1", 1, Colors.black54),
                              buildButton("2", 1, Colors.black54),
                              buildButton("3", 1, Colors.black54),
                            ]),
                            TableRow(children: [
                              buildButton("0", 1, Colors.black54),
                              buildButton(".", 1, Colors.black54),
                              buildButton("C", 1, Colors.black54),
                            ]),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 5),

                    // Container(
                    //   child:
                    Column(
                      children: [
                        Row(children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () => buttonPressed("-"),
                                    style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.all(0.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        )),
                                    child: Ink(
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomRight,
                                            end: Alignment.topLeft,
                                            colors: [
                                              Colors.pinkAccent,
                                              Colors.orangeAccent
                                            ]),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(80.0)),
                                      ),
                                      child: Container(
                                        constraints: const BoxConstraints(
                                            minWidth: 64, minHeight: 60),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          '-',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 40),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () => buttonPressed("+"),
                                    style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.all(0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        )),
                                    child: Ink(
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomRight,
                                            end: Alignment.topLeft,
                                            colors: [
                                              Colors.pinkAccent,
                                              Colors.orangeAccent
                                            ]),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(80.0)),
                                      ),
                                      child: Container(
                                        constraints: const BoxConstraints(
                                            minWidth: 64.0, minHeight: 140.0),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          '+',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 40),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(width: 15),
                          Column(
                            children: [
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () => buttonPressed("/"),
                                    style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.all(0.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        )),
                                    child: Ink(
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomRight,
                                            end: Alignment.topLeft,
                                            colors: [
                                              Colors.pinkAccent,
                                              Colors.orangeAccent
                                            ]),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(60.0)),
                                      ),
                                      child: Container(
                                        constraints: const BoxConstraints(
                                            minWidth: 64.0, minHeight: 60.0),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          '/',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 40),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () => buttonPressed("*"),
                                    style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.all(0.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        )),
                                    child: Ink(
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomRight,
                                            end: Alignment.topLeft,
                                            colors: [
                                              Colors.pinkAccent,
                                              Colors.orangeAccent
                                            ]),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(80.0)),
                                      ),
                                      child: Container(
                                        constraints: const BoxConstraints(
                                            minWidth: 64.0, minHeight: 60.0),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          '*',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 40),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () => buttonPressed("%"),
                                    style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.all(0.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        )),
                                    child: Ink(
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomRight,
                                            end: Alignment.topLeft,
                                            colors: [
                                              Colors.pinkAccent,
                                              Colors.orangeAccent
                                            ]),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(80.0)),
                                      ),
                                      child: Container(
                                        constraints: const BoxConstraints(
                                            minWidth: 64.0, minHeight: 63.0),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          '%',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 40),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ]),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () => buttonPressed("="),
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  )),
                              child: Ink(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomRight,
                                      end: Alignment.topLeft,
                                      colors: [Colors.pink, Color(0xFFF48FB1)]),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(80.0)),
                                ),
                                child: Container(
                                  constraints: const BoxConstraints(
                                      minWidth: 150.0, minHeight: 60.0),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    '=',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 40),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    // ),
                  ]),
            ])));
  }
}
