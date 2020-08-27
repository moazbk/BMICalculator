
import 'package:flutter/cupertino.dart';
import 'dart:math';
class CalculatorBrain{
  final int height;
  final int weight;
  String _type;
  double _bmi;
  CalculatorBrain({@required this.weight,@required this.height});
  String calculateBMI(){
    _bmi=weight/  pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi>=25)
      {
        _type="Overweight";
        return 'You have a higher than normal body weight. Try to exercise more.';
      }

    else if(_bmi>18.5)
      {
        _type="NORMAL";
        return 'You have a normal body weight. Good job!';
      }

    else
     {
       _type="Underweight";
       return 'You have a lower than normal body weight. You can a eat a bit more.';
     }
    }
  String TypeText(){
    return _type;
  }
}
