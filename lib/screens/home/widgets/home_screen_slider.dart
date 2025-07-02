import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/screens/home/controller/notifier/home_screen_notifier.dart';

import '../../../utility/app_Colors.dart';

Widget banner({required WidgetRef ref, required PageController controller}) {
  int index = ref.watch(homeScreenSliderIndexNotifierProvider);
  return Column(
    children: [
      SizedBox(
        width: double.maxFinite,
        height: 160.h,
        child: PageView(
          controller: controller,
          onPageChanged: (value) => ref
              .read(homeScreenSliderIndexNotifierProvider.notifier)
              .getIndex(value),
          children: [
            bannerData(index: 1),
            bannerData(index: 2),
            bannerData(index: 3),
            bannerData(index: 4),
          ],
        ),
      ),
      SizedBox(height: 10.h),
      DotsIndicator(
        position: index.toDouble(),
        dotsCount: 4,
        mainAxisAlignment: MainAxisAlignment.center,
        decorator: DotsDecorator(
          size: Size.square(9),
          activeSize: Size(20.w, 8.h),
          activeColor: AppColors.primaryElement,
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onTap: (val) {
          ref
              .read(homeScreenSliderIndexNotifierProvider.notifier)
              .getIndex(val);

          controller.animateToPage(
            val,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
          if (kDebugMode) {
            print('The indicator position is $val ');
          }
        },
      ),
    ],
  );
}

Widget bannerData({required int index}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Container(
      width: double.maxFinite,
      height: 140.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/icons/image($index).png'),
        ),
      ),
    ),
  );
}
