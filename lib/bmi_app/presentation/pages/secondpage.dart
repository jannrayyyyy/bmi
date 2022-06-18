import 'package:bmi_app/bmi_app/data/models/bmi_model.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final List<BmiModel> output;

  const SecondPage({
    Key? key,
    required this.output,
  }) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        const SizedBox(height: 40),
        Container(
          alignment: Alignment.center,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'HISTORY',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        Column(
          children: widget.output.map((e) {
            return Container(
                width: double.infinity,
                color: colorCondition(double.parse(e.bmi)),
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(20),
                child: Text(e.bmi));
          }).toList(),
        ),
      ]),
    );
  }

  Color colorCondition(double number) {
    if (number <= 18.5) {
      return Colors.lightBlue;
    } else if (number <= 24.9) {
      return Colors.green;
    } else if (number <= 29.9) {
      return Colors.yellow;
    } else if (number <= 34.9) {
      return Colors.red;
    } else {
      return Colors.purpleAccent;
    }
  }
}
