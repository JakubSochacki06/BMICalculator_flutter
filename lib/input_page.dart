import 'package:bmi_calc_github/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calc_github/top_cards.dart';
import 'package:bmi_calc_github/reusable_card.dart';
import 'constants.dart';
import 'package:bmi_calc_github/round_icon_button.dart';
import 'bmi_brain.dart';
import 'dart:math';

enum Gender { male, female }

enum MathOperation { plus, minus }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  void nothing() {
    null;
  }

  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;
  // void updateColour(Gender gender){
  //   if(gender == Gender.male){
  //     if(maleCardColor == inactiveCard){
  //       maleCardColor = activeCard;
  //       femaleCardColor = inactiveCard;
  //     } else {
  //       // delete this if you want to not be able to uncheck it
  //       maleCardColor = inactiveCard;
  //     }
  //   } else {
  //     if(femaleCardColor == inactiveCard){
  //       femaleCardColor = activeCard;
  //       maleCardColor = inactiveCard;
  //     } else {
  //       // delete this if you want to not be able to uncheck it
  //       femaleCardColor = inactiveCard;
  //     }
  //   }
  // }

  void updateWeight(MathOperation mathOperation) {
    if (mathOperation == MathOperation.plus) {
      setState(() {
        weight++;
      });
    } else {
      setState(() {
        weight--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? kActiveCard
                        : kInactiveCard,
                    cardChild: TopCards(
                      text: "MALE",
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? kActiveCard
                        : kInactiveCard,
                    cardChild: TopCards(
                      text: "FEMALE",
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCard,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbColor: kRecalculateContainerColor,
                        activeTrackColor: kRecalculateContainerColor,
                        overlayColor: Color(0x29EB1555),
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15.0,
                        ),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
              onPress: nothing,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kActiveCard,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                updateWeight(MathOperation.minus);
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                updateWeight(MathOperation.plus);
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    onPress: nothing,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCard,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    onPress: nothing,
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              double bmi = weight / pow(height / 100, 2);
              BmiBrain calc = BmiBrain(height: height, weight: weight, bmi: bmi);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      resultText: calc.getResult(),
                      bmiResult: calc.RoundBMI(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ),
                );
            },
            text: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({required this.text, required this.onTap});
  final onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(bottom: 20.0),
        color: kRecalculateContainerColor,
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
          child: Text(
            text,
            style: kLargeNumberText,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}


