import 'package:bmi_app/bmi_app/core/utils/bmi_filter.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text(
                'HISTORY',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    widget.output.clear();
                  });
                },
                child: const Icon(Icons.delete))
          ],
        ),
      ),
      body: ListView(children: [
        Column(
          children: widget.output.map((e) {
            return Container(
                width: double.infinity,
                color: Colors.grey[200],
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textCondition(double.parse(e.bmi)),
                    Text(e.bmi),
                  ],
                ));
          }).toList(),
        ),
      ]),
    );
  }
}
