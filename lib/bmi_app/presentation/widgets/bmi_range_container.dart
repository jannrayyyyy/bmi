import 'package:flutter/material.dart';

class BmiRangeContainer extends StatelessWidget {
  const BmiRangeContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9), color: Colors.grey[200]),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.lightBlue),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'BELOW 18.5 = UNDERWEIGHT',
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.green),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '18.5 - 24.9 = NORMAL WEIGHT',
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.yellow),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '25.0 - 29.9 = OVERWEIGHT',
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: Colors.red),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '30.0 - 34.9 = OBESITY CLASS I',
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.purpleAccent),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'ABOVE 40 = OBESITY',
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
