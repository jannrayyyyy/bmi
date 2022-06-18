import 'package:flutter/material.dart';

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

Text textCondition(double text) {
  if (text <= 18.5) {
    return const Text(
      'UNDER WEIGHT',
      style: TextStyle(
        color: Colors.lightBlue,
        fontWeight: FontWeight.bold,
      ),
    );
  } else if (text <= 24.9) {
    return const Text('NORMAL WEIGHT',
        style: TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
        ));
  } else if (text <= 29.9) {
    return const Text('OVER WEIGHT',
        style: TextStyle(
          color: Colors.yellow,
          fontWeight: FontWeight.bold,
        ));
  } else if (text <= 34.9) {
    return const Text('OBESITY CLASS 1',
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ));
  } else {
    return const Text('OBESITY',
        style: TextStyle(
          color: Colors.purpleAccent,
          fontWeight: FontWeight.bold,
        ));
  }
}
