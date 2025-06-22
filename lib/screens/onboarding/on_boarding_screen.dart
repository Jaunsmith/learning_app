import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_app/screens/onboarding/notifiers/on_boarding_notifier.dart';
import 'package:learning_app/screens/onboarding/widget/introduction_outline.dart';

import '../../utility/app_Colors.dart';

class OnBoardingScreen extends ConsumerWidget {
  OnBoardingScreen({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context, WidgetRef widgetRef) {
    final index = widgetRef.watch(indexDotProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 30),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              PageView(
                onPageChanged: (value) {
                  widgetRef.read(indexDotProvider.notifier).updateIndex(value);
                },
                controller: _pageController,
                children: [
                  IntroductionOutline(
                    imagePath: 'assets/images/reading.png',
                    headText: 'First See learning',
                    subText:
                        'Forget about paper, all knowledge in one learning',
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
              Positioned(
                bottom: 200,
                child: DotsIndicator(
                  position: index.toDouble(),
                  dotsCount: 3,
                  mainAxisAlignment: MainAxisAlignment.center,
                  decorator: DotsDecorator(
                    size: Size.square(9),
                    activeSize: Size(20, 8),
                    activeColor: AppColors.primaryElement,
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
