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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.output.map((e) {
          return Text(e.bmi);
        }).toList(),
      ),
    );
  }
}
