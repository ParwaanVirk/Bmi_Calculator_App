import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusecard.dart';
import 'constants.dart';
import 'roundbutton.dart';
import 'result_page.dart';
import 'brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Color maleCardColour = Color(0xFF111328);
  Color femaleCardColour = Color(0xFF111328);
  double height = 180;
  int weight = 60;
  int age = 19;

  // 1 == male, 2 == female
  void updateColour(Gender selectedGender) {
    if (selectedGender == Gender.male) {
      if (maleCardColour == Color(0xFF111328)) {
        maleCardColour = Color(0xFF1D1E33);
        femaleCardColour = Color(0xFF111328);
      } else {
        maleCardColour = Color(0xFF111328);
      }
    } else {
      if (femaleCardColour == Color(0xFF111328)) {
        femaleCardColour = Color(0xFF1D1E33);
        maleCardColour = Color(0xFF111328);
      } else {
        femaleCardColour = Color(0xFF111328);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    // taken from reusecard.dart
                    onPress: () {
                      setState(() {
                        updateColour(Gender.male);
                      });
                    },
                    colorcont: maleCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 80.0,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Male',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF8D8E98),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    // taken from reusecard.dart
                    onPress: () {
                      setState(() {
                        updateColour(Gender.female);
                      });
                    },
                    colorcont: femaleCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 80.0,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Female',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF8D8E98),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              // taken from reusecard.dart
              colorcont: Color(0xFF1D1E33),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT', style: labelTextStyle
                      // taken from constants file
                      ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: knumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: labelTextStyle,
                        ),
                      ]),
                  Slider(
                    value: height,
                    min: 120.0,
                    max: 250.0,
                    activeColor: Colors.white,
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round().toDouble();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    // taken from reusecard.dart
                    colorcont: Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Weight(in Kg)', style: labelTextStyle),
                        Text(weight.toString(), style: knumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                              prsd: () {
                                setState(() {
                                  weight -= 1;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                              prsd: () {
                                setState(() {
                                  weight += 1;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    // taken from reusecard.dart
                    colorcont: Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Age', style: labelTextStyle),
                        Text(age.toString(), style: knumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                              prsd: () {
                                setState(() {
                                  age -= 1;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                              prsd: () {
                                setState(() {
                                  age += 1;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {

              CalculatorBrain calc = CalculatorBrain(height: height.toInt(), weight: weight);

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultPage(
                    bmiResult: calc.calculatorBMI(),
                    resultText: calc.getResult(),
                    resultstring: calc.getInter(),
                  )));
            },
            child: Container(
              child: Center(
                child: Text('CALCULATE', style: klargeTextStyle),
              ),
              color: Colors.redAccent[400],
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 60.0,
            ),
          )
        ],
      ),
    );
  }
}

// learnt about boxdecoration
// we have to move color into boxdecorarion
// extraction of widget
// when to use keys in flutter -- see youtube video
// understand the layout once .. how rows and columns are placed
// final vs const.. see once again
// use of enums
// use of ternary operator.. same as before ==
// condition ? if : else
// flutter slider .. lecture 10

// see video on dart maps .. video no 14
// how to pass data from one page to another page 
