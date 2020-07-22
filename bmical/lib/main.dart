import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
        ),
        accentColor: Colors.purple,
      ),
      home: InputPage(),
    );
  }
}

// learnt about creating some common theme properties, for the entire app, using themedata class
// TODO: remember to read the Themedata from the flutter documentation
// we can wrap anything with a theme, and define its custom theme.. for ex we can wrap floating actionbutton

// screens are arranged in a stack(data structure) method in flutter
// see cookbook on naviagation routes avaailbale in flutter docs
// cant have initialroute and home together .. app will crash 
