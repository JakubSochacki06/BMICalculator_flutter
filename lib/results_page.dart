import 'package:bmi_calc_github/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calc_github/reusable_card.dart';
import 'package:bmi_calc_github/bottom_button.dart';
import 'dart:io';

class ResultsPage extends StatelessWidget {
  ResultsPage({required this.bmiResult, required this.resultText, required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI RESULT'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  'Your result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
                color: kActiveCard,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: kBmiTextStyle,
                    ),
                    Text(
                      interpretation,
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                onPress: () {}),
          ),
          GestureDetector(
            onTap: (){ Navigator.pop(context);},
            child: Container(
              padding: EdgeInsets.only(bottom: 20.0),
              color: kRecalculateContainerColor,
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              width: double.infinity,
              height: kBottomContainerHeight,
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: kLargeNumberText,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

