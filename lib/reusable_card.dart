import 'package:flutter/material.dart';
import 'package:bmi_calc_github/constants.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required Color this.color, required this.cardChild, required this.onPress});
  final Color color;
  final Widget cardChild;
  final onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}