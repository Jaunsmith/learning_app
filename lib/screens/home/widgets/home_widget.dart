import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/screens/signin/widgets/login_options.dart';
import 'package:learning_app/utility/app_Colors.dart';
import 'package:learning_app/utility/decoration.dart';
import 'package:learning_app/widgets/text_data.dart';

AppBar homeAppBar() {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(1),
      child: Container(
        height: 1.h,
        width: double.maxFinite,
        color: Colors.grey.shade200,
      ),
    ),
    title: Container(
      margin: EdgeInsets.symmetric(horizontal: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu, size: 40.r),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage('assets/icons/person.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget homePageTabPick(String text) {
  return GestureDetector(
    child: Container(
      margin: EdgeInsets.only(right: 30),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      decoration: decoration(
        border: true,
        borderRadius: BorderRadius.circular(7.r),
      ),
      child: Center(
        child: dynamicTextData(
          text,
          color: AppColors.primaryElementText,
          fontWeight: FontWeight.bold,
          fontSize: 11.sp,
        ),
      ),
    ),
  );
}

class AppMenuBar extends StatelessWidget {
  const AppMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            mainTextNormal(
              'Choose your course',
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
            clickableButton(text: 'see all', fontSize: 10),
          ],
        ),
        SizedBox(height: 20.h),
        Row(
          children: [
            homePageTabPick('All'),
            homePageTabPick('Popular'),
            homePageTabPick('Newest'),
          ],
        ),
      ],
    );
  }
}
