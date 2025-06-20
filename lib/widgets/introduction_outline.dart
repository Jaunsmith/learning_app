import 'package:flutter/material.dart';
import 'package:learning_app/widgets/welcome_data.dart';

class IntroductionOutline extends StatelessWidget {
  const IntroductionOutline({
    super.key,
    required this.imagePath,
    required this.headText,
    required this.subText,
    required this.index,
    required this.pageController,
  });

  final String imagePath;
  final String headText;
  final String subText;
  final int index;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imagePath),
        mainTextNormal(headText),
        SizedBox(height: 10),
        subTextNormal(subText),
        SizedBox(height: 70),
        nextButton(index, pageController),
      ],
    );
  }
}
