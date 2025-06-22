import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/widgets/text_data.dart';

import '../../../utility/decoration.dart';

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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: subTextNormal(subText),
        ),
        SizedBox(height: 100),
        nextButton(index, pageController, context),
      ],
    );
  }
}

Widget nextButton(
  int index,
  PageController pageController,
  BuildContext context,
) {
  return GestureDetector(
    onTap: () {
      if (index < 3) {
        pageController.animateToPage(
          index,
          duration: Duration(microseconds: 300),
          curve: Curves.linear,
        );
      } else {
        Navigator.pushNamed(context, '/signIn');
      }
    },
    child: Container(
      height: 50.h,
      width: 325.w,
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
