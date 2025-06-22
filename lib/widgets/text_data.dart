import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/utility/app_Colors.dart';

Widget mainTextNormal(String textData, {Color color = AppColors.primaryText}) {
  return Text(
    textData,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      color: color,
    ),
  );
}

Widget subTextNormal(
  String textData, {
  Color color = AppColors.primarySecondaryElementText,
}) {
  return Text(
    textData,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.normal,
      color: color,
    ),
  );
}

Widget sigIn14Text(
  String textData, {
  Color color = AppColors.primaryThreeElementText,
  bool textUnderLine = false,
}) {
  return Text(
    textData,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
      color: color,
      decoration: textUnderLine
          ? TextDecoration.underline
          : TextDecoration.none,
      decorationColor: AppColors.primaryText,
    ),
  );
}
