import 'package:flutter/material.dart';
import 'constants.dart';
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
      onTap: onTap(),
    );
  }
}