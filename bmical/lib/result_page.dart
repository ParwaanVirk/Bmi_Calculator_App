import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusecard.dart';
import 'brain.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.bmiResult, @required this.resultText, @required this.resultstring});


  final String bmiResult;
  final String resultText;
  final String resultstring;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Text('Your Result', style: kTitleTextStyle),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colorcont: Color(0xFF1D1E33),
                cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          resultText.toUpperCase(),
                          style: TextStyle(
                            color: Colors.green[600],
                            fontSize: 40.0,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      
                      Text(
                        bmiResult,
                        style: TextStyle(
                          fontSize: 70.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          resultstring.toUpperCase(),
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ]),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Center(
                  child: Text('RE-CALCULATE', style: klargeTextStyle),
                ),
                color: Colors.redAccent[400],
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: 60.0,
              ),
            ),
          ]),
    );
  }
}
