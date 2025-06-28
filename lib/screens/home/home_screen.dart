import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/utility/decoration.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container()),
      bottomNavigationBar: Container(
        width: 375.w,
        height: 58.h,
        decoration: decoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.h),
            topLeft: Radius.circular(20.h),
          ),
        ),
      ),
    );
  }
}
