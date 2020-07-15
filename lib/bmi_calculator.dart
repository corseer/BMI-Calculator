import 'dart:math';

class Calculator {
  Calculator({this.weight, this.height});

  double _bmi;

  final int weight;
  final int height;

  String calculate() {
    _bmi = weight / pow(height / 100, 2);
    print(_bmi);
    return _bmi.toStringAsFixed(2);
  }

  String result() {
    if (_bmi >= 30) {
      return 'Obese';
    } else if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String remark() {
    if (_bmi >= 30) {
      return 'Your body weight is way higher than normal. Try to exercise more'
          ' and regulate your diet. Good Luck !! ';
    } else if (_bmi >= 25) {
      return 'Your body weight is higher than normal. Try to exercise more !!';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Well Done !!';
    } else {
      return 'Your body weight is lower than normal. Try to maintain a proper'
          'diet plan. Good Luck !!';
    }
  }
}
