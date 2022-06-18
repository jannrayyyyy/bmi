import 'package:bmi_app/bmi_app/data/models/bmi_model.dart';
import 'package:bmi_app/bmi_app/presentation/pages/secondpage.dart';
import 'package:flutter/material.dart';
import 'package:general/general.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<BmiModel> bmis = [];
  final heights = TextEditingController();
  final weights = TextEditingController();
  String bmiOutput = '';

  void calculate() {
    double total = (int.parse(weights.text) *
        int.parse(weights.text) /
        int.parse(heights.text));
    bmiOutput = total.toStringAsFixed(2);
    final bmiModel = BmiModel(bmi: bmiOutput);
    bmis.add(bmiModel);
  }

  final wKEy = GlobalKey<FormState>();
  final hKEy = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(output: bmis),
                  ),
                );
              },
              icon: const Icon(Icons.history),
              color: Colors.blueGrey,
              iconSize: 35,
            ),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(children: [
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
              CustomTextField(
                'Height',
                controller: heights,
                keyboard: TextInputType.number,
                validator: (value) {
                  if (value!.length > 3) {
                    return 'input must be 3 or lower';
                  } else {
                    return null;
                  }
                },
                formKey: hKEy,
              ),
              const SizedBox(height: 30),
              // weight text
              CustomTextField(
                'weght',
                controller: weights,
                keyboard: TextInputType.number,
                validator: (value) {
                  if (value!.length > 3) {
                    return 'input must be 3 or lower';
                  } else {
                    return null;
                  }
                },
                formKey: wKEy,
              ),
              const SizedBox(height: 30),
              // calculate button
              InkWell(
                onTap: () {
                  if (wKEy.currentState!.validate() &&
                      hKEy.currentState!.validate()) {
                    setState(() {
                      calculate();
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        duration: Duration(milliseconds: 300),
                        backgroundColor: Colors.white,
                        content: Text(
                          'Invalid Input',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    );
                  }
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
