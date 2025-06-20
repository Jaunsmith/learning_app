import 'package:flutter/material.dart';
import 'package:learning_app/widgets/introduction_outline.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              children: [
                IntroductionOutline(
                  imagePath: 'assets/images/reading.png',
                  headText: 'First See learning',
                  subText: 'Forget about paper, all knowledge in one learning',
                  index: 1,
                  pageController: _pageController,
                ),
                IntroductionOutline(
                  pageController: _pageController,
                  imagePath: 'assets/images/man.png',
                  headText: 'Connect with everyone',
                  subText:
                      'Always keep in touch with your tutor and friends . let get connected ',
                  index: 2,
                ),
                IntroductionOutline(
                  pageController: _pageController,
                  imagePath: 'assets/images/boy.png',
                  headText: 'Always fascinated learning',
                  subText:
                      'Anywhere any time the time is at your discretion so study anywhere you can ',
                  index: 3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
