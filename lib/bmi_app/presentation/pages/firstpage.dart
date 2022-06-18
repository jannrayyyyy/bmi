import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final heights = TextEditingController();
  final weights = TextEditingController();
  String bmiOutput = '';

  void calculate() {
    double total = (int.parse(weights.text) *
        int.parse(weights.text) /
        int.parse(heights.text));
    bmiOutput = total.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 30),
              // title text
              const Text('BMI \n CALCULATOR',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
              const SizedBox(height: 30),
              // height text field
              TextFormField(
                  controller: heights, keyboardType: TextInputType.number),
              const SizedBox(height: 30),
              // weight text
              TextFormField(
                validator: (value) {
                  if (value! == 1) {
                    return 'error';
                  } else {
                    return null;
                  }
                },
                controller: weights,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 30),
              // calculate button
              InkWell(
                onTap: () {
                  setState(() {
                    calculate();
                  });
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey,
                  ),
                  child: const Text(
                    'Calculate',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 70),
              //display button
              bmiOutput.isEmpty
                  ? const SizedBox.shrink()
                  : Container(
                      padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(10),
                          color: colorCondition(double.parse(bmiOutput))),
                      child: Text(bmiOutput)),
            ],
          ),
        ),
      ]),
    );
  }

  Color colorCondition(double number) {
    if (number <= 18.5) {
      // lightblue - underweight
      return Colors.lightBlue;
    } else if (number <= 18.5) {
      return Colors.green;
    } else if (number <= 24.9) {
      return Colors.yellow;
    } else if (number <= 29.9) {
      return Colors.red;
    } else {
      return Colors.purpleAccent;
    }
  }
}
