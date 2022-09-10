import 'package:flutter/material.dart';
import 'input_page.dart';
import 'package:bmi_calc_github/results_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/results': (context) => ResultsPage(
          resultText: '',
          bmiResult: '',
          interpretation: '',
        ),
      },
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          color: Color(0xFF0A0D22),
        ),
        scaffoldBackgroundColor: Color(0xFF0A0D22),
      ),
      // home: InputPage(),
    );
  }
}

