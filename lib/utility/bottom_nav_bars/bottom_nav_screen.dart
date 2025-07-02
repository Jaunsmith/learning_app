import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/utility/app_Colors.dart';
import 'package:learning_app/utility/bottom_nav_bars/bottombars.dart';
import 'package:learning_app/utility/decoration.dart';

import 'notifier/bottom_nav_notifier.dart';

class BottomNavScreen extends ConsumerWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef widgetRef) {
    int selectedIndex = widgetRef.watch(bottomNavNotifierProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: appScreens(selectedIndex)),
      bottomNavigationBar: Container(
        // width: 375.w,
        // height: 58.h,
        decoration: decoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.h),
            topLeft: Radius.circular(20.h),
          ),
          decoColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            widgetRef.read(bottomNavNotifierProvider.notifier).getIndex(index);
          },
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: AppColors.primaryFourElementText,
          selectedItemColor: AppColors.primaryElement,
          selectedLabelStyle: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
          items: [
            bottomBars(icon: Icons.home, label: 'Home'),
            bottomBars(icon: Icons.search, label: 'Person'),
            bottomBars(icon: Icons.play_circle, label: 'Play'),
            bottomBars(icon: Icons.messenger_rounded, label: 'Message'),
            bottomBars(icon: Icons.person, label: 'Profile'),
          ],
          elevation: 0,
        ),
      ),
    );
  }
}
