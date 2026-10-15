import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Screen()));
}

class Screen extends StatefulWidget {
  const new({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  double? firstCislo = null;
  String znak = " ";
  bool newCislo = true;
  String resultText = "0";

  void calculate() {
    final operation = znak;
    final a = firstCislo;
    final b = double.tryParse(resultText);
    if (a == null || b == null || operation == null || newCislo == true) {
      setState(() {
        resultText = "0";
        newCislo = false;
      });
      return;
    }
    double answer = 0;
    if (operation == "+") {
      answer = addN(a, b);
    } else if (operation == "-") {
      answer = substractN(a, b);
    } else if (operation == "*") {
      answer = multiplyN(a, b);
    } else if (operation == "/") {
      if (b == 0) {
        setState(() {
          resultText = "На ноль не делится";
          newCislo = false;
        });
        return;
      } else
        answer = divideN(a, b);
    }
    setState(() {
      resultText = answer.toStringAsFixed(10);
      while (resultText.endsWith("0")) {
        resultText = resultText.substring(0, resultText.length - 1);
      }
      if (resultText.endsWith(".")) {
        resultText = resultText.substring(0, resultText.length - 1);
      }
      newCislo = false;
      firstCislo = null;
      znak = " ";
    });
  }

  void InputCislo(String Cislo) {
    setState(() {
      if (resultText == "0" ||
          newCislo == true ||
          resultText == "На ноль не делится") {
        resultText = Cislo;
        newCislo = false;
      } else {
        resultText += Cislo;
      }
    });
  }

  void Operation(String Operation) {
    final number = double.tryParse(resultText);
    if (number == null) {
      return;
    }
    setState(() {
      firstCislo = number;
      znak = Operation;
      newCislo = true;
    });
  }

  void clearInput() {
    setState(() {
      resultText = "0";
      firstCislo = null;
      znak = " ";
      newCislo = false;
    });
  }

  void InputDot() {
    setState(() {
      if (newCislo == true) {
        resultText = "0.";
        newCislo = false;
      } else {
        if (resultText.contains(".") == false) {
          resultText += ".";
        }
      }
    });
  }

  void DeleteLast() {
    if (newCislo == true) {
      return;
    }
    setState(() {
      if (resultText.length <= 1) {
        resultText = "0";
      } else {
        resultText = resultText.substring(0, resultText.length - 1);
      }
    });
  }

  void Zaticka() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 213, 24),
      body: Center(
        child: SizedBox(
          width: 230,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "COLCOLOTOR",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.purpleAccent,
                ),
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        znak.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight(20),
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        resultText,
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight(40),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      clearInput();
                    },
                    child: Text("C"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      DeleteLast();
                    },
                    child: Text("D"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Zaticka();
                    },
                    child: Text(""),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purpleAccent,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Operation("+");
                    },
                    child: Text(
                      "+",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      InputCislo("7");
                    },
                    child: Text("7"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      InputCislo("8");
                    },
                    child: Text("8"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      InputCislo("9");
                    },
                    child: Text("9"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purpleAccent,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Operation("-");
                    },
                    child: Text(
                      "-",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      InputCislo("4");
                    },
                    child: Text("4"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      InputCislo("5");
                    },
                    child: Text("5"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      InputCislo("6");
                    },
                    child: Text("6"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purpleAccent,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Operation("*");
                    },
                    child: Text(
                      "*",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      InputCislo("1");
                    },
                    child: Text("1"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      InputCislo("2");
                    },
                    child: Text("2"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      InputCislo("3");
                    },
                    child: Text("3"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purpleAccent,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Operation("/");
                    },
                    child: Text(
                      "/",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Zaticka();
                    },
                    child: Text(""),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      InputCislo("0");
                    },
                    child: Text("0"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      InputDot();
                    },
                    child: Text("."),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purpleAccent,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      calculate();
                    },
                    child: Text(
                      "=",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

double addN(double firstN, double secondN) {
  return (firstN + secondN);
}

double substractN(double firstN, double secondN) {
  return (firstN - secondN);
}

double multiplyN(double firstN, double secondN) {
  return (firstN * secondN);
}

double divideN(double firstN, double secondN) {
  return (firstN / secondN);
}
