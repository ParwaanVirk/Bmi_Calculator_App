import 'dart:math';

class CalculatorBrain {

  CalculatorBrain({this.height, this.weight});


  final int height;
  final int weight;
  double _bmi;

  String calculatorBMI() {
       _bmi = weight/ pow(height/100, 2);
      
      return _bmi.toStringAsFixed(1);
  }

  String getResult() {

    if(_bmi >= 25)
      return 'Overweight';

    else if(_bmi >= 18.5 && _bmi < 25)
     return 'Normal';

    else
      return 'Under Weight';
  }

  String getInter(){
    if(_bmi >= 25)
      return 'You are fat, LOSE WEIGHT';

    else if(_bmi >= 18.5 && _bmi < 25)
     return 'You are normal, But You can get Fitter';

    else
      return 'Eat something you skinny piece of shit';
  }

  
}

// math library functions .. read once ..