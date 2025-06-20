import 'package:flutter/material.dart';
import 'package:learning_app/utility/app_Colors.dart';

import '../utility/decoration.dart';

Widget mainTextNormal(String textData, {Color color = AppColors.primaryText}) {
  return Text(
    textData,
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color),
  );
}

Widget subTextNormal(
  String textData, {
  Color color = AppColors.primarySecondaryElementText,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Text(
      textData,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: color,
      ),
    ),
  );
}

Widget nextButton(int index, PageController pageController) {
  return GestureDetector(
    onTap: () {
      if (index < 3) {
        pageController.animateToPage(
          index,
          duration: Duration(microseconds: 300),
          curve: Curves.bounceIn,
        );
      }
    },
    child: Container(
      height: 50,
      width: 325,
      decoration: decoration(),
      child: Center(
        child: mainTextNormal(
          index < 3 ? 'Next' : 'Get Started',
          color: Colors.white,
        ),
      ),
    ),
  );
}
